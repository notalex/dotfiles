# Fresh Omarchy Setup

Configure omarchy for personal use.
Setup `custom.menu` and `custom.clipboard` on a fresh Omarchy installation.

## 1. Clone Plugins
Clone stock plugins and rename directories to the custom namespace:
```bash
omarchy plugin clone omarchy.menu
omarchy plugin clone omarchy.clipboard
mv ~/.config/omarchy/plugins/*\.menu ~/.config/omarchy/plugins/custom.menu
mv ~/.config/omarchy/plugins/*\.clipboard ~/.config/omarchy/plugins/custom.clipboard
```

## 2. Update Manifests
In `manifest.json` for each plugin:
- `~/.config/omarchy/plugins/custom.menu/manifest.json`:
  Set `"id": "custom.menu"` and ensure `"omarchy": { "clonedFrom": "omarchy.menu" }`.
- `~/.config/omarchy/plugins/custom.clipboard/manifest.json`:
  Set `"id": "custom.clipboard"` and ensure `"omarchy": { "clonedFrom": "omarchy.clipboard" }`.

*(The `clonedFrom` field ensures IPC commands like `omarchy-menu toggle` route to the custom clone).*

## 3. Add Readline / Vim Navigation Chords
In both `custom.menu/Menu.qml` and `custom.clipboard/Clipboard.qml`, update `keyCatcher` -> `Keys.onPressed` to support:
- **Ctrl+[** (`Qt.Key_BracketLeft`): Same as Escape (clear filter if typed, otherwise cancel/close).
- **Ctrl+H** (`Qt.Key_H`): Same as Backspace (delete last character from filter, or navigate back if empty).
- **Ctrl+M** (`Qt.Key_M`): Same as Enter/Return (activate/select current item).
- **Ctrl+P** (`Qt.Key_P`): Same as Up arrow (`select(-1)`).
- **Ctrl+N** (`Qt.Key_N`): Same as Down arrow (`select(1)`).

> Check `event.modifiers & Qt.ControlModifier` for Ctrl combinations so ordinary typing isn't blocked, and set `event.accepted = true`.

## 4. Shell Registration (`~/.config/omarchy/shell.json`)
Configure `shell.json`:
- Replace `"omarchy.menu"` with `{"id": "custom.menu"}` in `bar.layout.left`.
- Add `{"id": "custom.clipboard"}` to `plugins`.
- Add `"omarchy.menu"` and `"omarchy.clipboard"` to `disabledPlugins`.
- Add `"custom.menu"` and `"custom.clipboard"` to `cloneSourceRestores`.

## 5. Setup theme
- Copy the "Osaka Jade" theme to ~/.config/omarchy/themes/osaka-jade-custom
- In colors.toml, change the `background` to `#000000`.
- Switch omarchy to this new theme.

## 6. Configure omarchy
```bash
# Ensure low fan noise
omarchy powerprofiles set ac power-saver
omarchy powerprofiles set battery power-saver

omarchy bar position bottom
omarchy bar transparent true

omarchy toggle screensaver # turn it off
```

## 7. Disable screen lock
```bash
omarchy toggle idle stay-awake # disable auto screen lock (super+ctrl+i toggles this)
systemctl --user mask --now omarchy-sleep-lock.service # disable screen lock on manual suspend
# The `switch:on:Lid` setting in bindings.lua prevents screen lock on laptop lid close.
```

## 8. Ensure suspend even when external monitor is connected.
- Create /etc/systemd/logind.conf.d/30-lid-docked-suspend.conf with:
```bash
[Login]
HandleLidSwitchDocked=suspend
```
- Reload systemd-logind

## 9. Apply Changes
```bash
omarchy-shell shell rescanPlugins
omarchy restart shell
hyprctl reload
```
