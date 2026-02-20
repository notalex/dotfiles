# Usage: key-debounce

import asyncio
import os
import sys
import evdev
from evdev import ecodes, UInput

KEYBOARD_MATCH = "Keychron"
DEBOUNCE_KEYS = {
    ecodes.KEY_T,
    ecodes.KEY_E,
}

# 50ms is safe -- a human key press-release cycle is always >60ms.
DEBOUNCE_MS = 50

def find_keyboard():
    devices = [evdev.InputDevice(p) for p in evdev.list_devices()]
    candidates = []

    for dev in devices:
        if KEYBOARD_MATCH and KEYBOARD_MATCH.lower() in dev.name.lower():
            # Prefer the primary HID interface (input0)
            if "input0" in (dev.phys or ""):
                return dev
            candidates.append(dev)

    if candidates:
        return candidates[0]

    print("Available keyboard devices:")
    for dev in devices:
        caps = dev.capabilities().get(ecodes.EV_KEY, [])
        if any(ecodes.KEY_A <= k <= ecodes.KEY_Z for k in caps):
            print(f"  {dev.path}  {dev.name}")
    print(f"\nNo device matched '{KEYBOARD_MATCH}'.")
    print("Edit KEYBOARD_MATCH or pass device path as argument.")
    sys.exit(1)

def key_name(code):
    name = ecodes.KEY.get(code)
    if name is None:
        return str(code)
    if isinstance(name, list):
        return str(name[0])
    return str(name)

async def run(device):
    loop = asyncio.get_event_loop()
    debounce_s = DEBOUNCE_MS / 1000.0

    ui = UInput.from_device(device, name=f"{device.name} (debounced)")
    device.grab()

    key_list = ", ".join(key_name(k) for k in sorted(DEBOUNCE_KEYS))
    print(f"Grabbed:  {device.name} ({device.path})")
    print(f"Virtual:  {ui.name}")
    print(f"Debounce: {DEBOUNCE_MS}ms on [{key_list}]")
    print("Running... Ctrl+C to stop\n")

    # Per-key debounce state
    last_forward_t = {}  # code -> monotonic time of last forwarded event
    pending_event = {}  # code -> (type, code, value)
    pending_handle = {}  # code -> asyncio.TimerHandle
    suppressed = 0

    def emit(etype, code, value):
        ui.write(etype, code, value)
        ui.syn()

    def flush_pending(code):
        """Send a deferred event once the debounce window expires."""
        if code in pending_event:
            ev_tuple = pending_event.pop(code)
            pending_handle.pop(code, None)
            emit(*ev_tuple)
            last_forward_t[code] = loop.time()

    try:
        async for ev in device.async_read_loop():
            # Pass through: non-key events, non-debounced keys, repeats
            if (
                ev.type != ecodes.EV_KEY
                or ev.code not in DEBOUNCE_KEYS
                or ev.value == 2
            ):
                ui.write_event(ev)
                continue

            now = loop.time()
            code = ev.code
            dt = now - last_forward_t.get(code, 0)

            if dt >= debounce_s:
                # Outside window -- forward immediately
                if code in pending_handle:
                    pending_handle.pop(code).cancel()
                    pending_event.pop(code, None)
                emit(ev.type, ev.code, ev.value)
                last_forward_t[code] = now
            else:
                # Inside window -- defer until window expires
                suppressed += 1
                print(f"Suppressed: {key_name(code)} ({dt * 1000:.0f}ms)")
                if code in pending_handle:
                    pending_handle[code].cancel()
                pending_event[code] = (ev.type, ev.code, ev.value)
                remaining = debounce_s - dt
                pending_handle[code] = loop.call_later(remaining, flush_pending, code)
    except (KeyboardInterrupt, SystemExit):
        pass
    finally:
        print(f"\nStopping. Suppressed {suppressed} chatter event(s).")
        try:
            device.ungrab()
        except OSError:
            pass
        ui.close()

def main():
    if len(sys.argv) > 1:
        device = evdev.InputDevice(sys.argv[1])
    else:
        device = find_keyboard()

    try:
        asyncio.run(run(device))
    except KeyboardInterrupt:
        pass

if __name__ == "__main__":
    main()
