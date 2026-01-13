#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
sudo apt install python3-evdev
sudo ~/bin/keyboard-debounce.py
"""

import os
import sys
import time
from evdev import InputDevice, UInput, ecodes, categorize, list_devices

# Configuration
DEBOUNCE_DELAY_MS = 100
DEBOUNCE_KEYS = ["t"]  # Keys to debounce


class KeyboardDebouncer:
    def __init__(
        self, debounce_delay=DEBOUNCE_DELAY_MS, keys_to_debounce=DEBOUNCE_KEYS
    ):
        self.debounce_delay = debounce_delay
        self.keys_to_debounce = keys_to_debounce
        self.last_keypress = {}

        self.input_device = None
        self.output_device = None

        self.setup_devices()

    def setup_devices(self):
        """Find keyboard device and create virtual output device"""
        # Find keyboard devices
        devices = [InputDevice(path) for path in list_devices()]
        keyboards = [d for d in devices if "keyboard" in d.name.lower()]

        if not keyboards:
            # Try to find any device with key capabilities
            keyboards = [d for d in devices if ecodes.EV_KEY in d.capabilities()]

        if not keyboards:
            print("No keyboard devices found!")
            print("Available devices:")
            for d in devices:
                print(f"  - {d.name} ({d.path})")
            sys.exit(1)

        # Use the first keyboard found
        self.input_device = keyboards[0]
        print(f"Using keyboard: {self.input_device.name}")

        # Grab the device exclusively
        self.input_device.grab()

        # Create virtual output device
        self.output_device = UInput.from_device(
            self.input_device, name="debounced-keyboard"
        )
        print("Virtual keyboard created: debounced-keyboard")

    def key_name(self, code):
        """Convert event code to key name"""
        try:
            key = ecodes.KEY[code]
            # Remove KEY_ prefix and convert to lowercase
            return key.replace("KEY_", "").lower()
        except (KeyError, AttributeError):
            return None

    def should_debounce(self, event):
        """Check if this keypress should be debounced"""
        # Only process key down events
        if event.type != ecodes.EV_KEY or event.value != 1:
            return False

        key = self.key_name(event.code)
        if not key or key not in self.keys_to_debounce:
            return False

        current_time = time.time() * 1000  # milliseconds
        last_time = self.last_keypress.get(key)

        if last_time and (current_time - last_time) < self.debounce_delay:
            time_diff = round(current_time - last_time, 1)
            print(
                f"BOUNCE detected! Key: '{key}', Time: {time_diff}ms (limit <{self.debounce_delay}ms)"
            )
            return True
        else:
            self.last_keypress[key] = current_time
            return False

    def run(self):
        """Main event loop"""
        print("Starting keyboard debouncer...")
        print(
            f"Debouncing keys: {', '.join(self.keys_to_debounce)} with {self.debounce_delay}ms delay"
        )
        print("Press Ctrl+C to stop")
        print()

        try:
            for event in self.input_device.read_loop():
                # Skip bounced keypresses
                if self.should_debounce(event):
                    continue

                # Forward all other events to virtual device
                self.output_device.write_event(event)
                self.output_device.syn()
        except KeyboardInterrupt:
            print("\nStopping debouncer...")
            self.cleanup()

    def cleanup(self):
        """Release devices"""
        if self.input_device:
            self.input_device.ungrab()
        if self.output_device:
            self.output_device.close()


def main():
    if os.geteuid() != 0:
        print("Error: This script must be run as root (sudo)")
        sys.exit(1)

    debouncer = KeyboardDebouncer()
    debouncer.run()


if __name__ == "__main__":
    main()
