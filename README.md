# Lyon's MacOS Nix flake

> Declarative macOS configuration via [Nix Darwin](https://github.com/LnL7/nix-darwin) + [Home Manager](https://github.com/nix-community/home-manager).

---

## Structure

```
.macOS/
├── flake.nix                   # Inputs, outputs, profiles
├── compose.nix                 # Shared config across all profiles
├── profile/
│   └── m3-macbook-air/         # Primary machine (aarch64-darwin)
│       ├── configuration.nix
│       └── hardware.nix
└── modules/
    ├── apps/
    │   ├── ghostty.nix         # Terminal emulator
    │   ├── nvim.nix            # Neovim (LazyVim)
    │   ├── zed.nix             # Zed editor
    │   └── software.nix        # Homebrew casks
    ├── commands/
    │   ├── btop.nix            # System monitor
    │   ├── fastfetch.nix       # System info
    │   ├── gh.nix              # GitHub CLI
    │   ├── shell.nix           # Aliases
    │   └── software.nix        # Nix CLI tools
    └── desktop/
        ├── aerospace.nix       # Tiling window manager
        ├── sketchybar.nix      # Status bar
        └── macos.nix           # System defaults
```

---

## Applying

```bash
sudo darwin-rebuild switch --flake /Users/lyon/.lyon#workstation
```

---

## Desktop

| Component      | Tool                                                          |
| -------------- | ------------------------------------------------------------- |
| Window Manager | [Aerospace](https://github.com/nikitabobko/AeroSpace)         |
| Status Bar     | [Sketchybar](https://github.com/FelixKratz/SketchyBar)        |
| Terminal       | [Ghostty](https://ghostty.org)                                |
| Shell          | [Nushell](https://www.nushell.sh)                             |
| Editor         | [Zed](https://zed.dev)                                        |
| Launcher       | [Raycast](https://raycast.com)                                |

### Aerospace Keybindings

| Key                    | Action                        |
| ---------------------- | ----------------------------- |
| `alt-h/j/k/l`          | Focus window                  |
| `alt-shift-h/j/k/l`    | Move window                   |
| `alt-1/2/3/4`          | Switch workspace              |
| `alt-shift-1/2/3/4`    | Move window to workspace      |
| `alt-/`                | Toggle tile layout            |
| `alt-,`                | Toggle accordion layout       |
| `alt-tab`              | Workspace back and forth      |
| `cmd-enter`            | New Ghostty terminal          |
| `alt-o/b/s/f/e/z`      | App shortcuts                 |

---

## Installation

**Prerequisites:** [Lix](https://lix.systems/install/) and [nix-darwin](https://github.com/LnL7/nix-darwin#install).

```bash
git clone https://github.com/ArcoNightshade/macOS
cd macOS
sudo darwin-rebuild switch --flake .#workstation
```

Existing config files are backed up with a `.bak` extension on first switch.
