This is my personal Nix flake I use on my macbook.

## Features:

Codifies the following settings (in no particular order):
- Basic user configuration in [roles/user.nix](./roles/user.nix)
- Installed applications with `brew` in [roles/brew.nix](./roles/brew.nix)
- Tiling windows and custom keyboard shortcuts with Yabai and SKHD in [roles/yabai.nix](./roles/yabai.nix)
- Firefox configuration with Home-Manager in [roles/home-manager/user.nix](./roles/home-manager/user.nix):
  - Default Firefox profile named `default`: https://github.com/heywoodlh/nix-darwin-flake/blob/c4f90bdf0d6d79de791d14fa59a1b648035fa838/roles/home-manager/user.nix#L10-L121
  - Better Firefox privacy tweaks: https://github.com/heywoodlh/nix-darwin-flake/blob/c4f90bdf0d6d79de791d14fa59a1b648035fa838/roles/home-manager/user.nix#L70-L121
  - Minimal Firefox appearance tweaks with UserChrome.css: https://github.com/heywoodlh/nix-darwin-flake/blob/c4f90bdf0d6d79de791d14fa59a1b648035fa838/roles/home-manager/user.nix#L25-L67
  - Installed Firefox Extensions with NUR: https://github.com/heywoodlh/nix-darwin-flake/blob/c4f90bdf0d6d79de791d14fa59a1b648035fa838/roles/home-manager/user.nix#L13-L24
- Other various settings in [roles](./roles)

## Requirements:

- Relatively modern MacOS version
- Nix installed: https://nixos.org/download.html#nix-install-macos
- Nix-Darwin installed: https://github.com/LnL7/nix-darwin#install

## Quickstart:

Assuming you want to build the `workstation` output, you'd use these commands:

```
git clone https://github.com/ArcoNightshade/macOS
cd macOS
darwin-rebuild switch --flake .#workstation
``` 
