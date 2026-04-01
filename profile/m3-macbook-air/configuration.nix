{ ... }:

{
  imports = [
    # Apps
    ../../modules/apps/ghostty.nix
    ../../modules/apps/nvim.nix
    ../../modules/apps/software.nix
    ../../modules/apps/zed.nix

    # Commands
    ../../modules/commands/btop.nix
    ../../modules/commands/fastfetch.nix
    ../../modules/commands/fish.nix
    ../../modules/commands/gh.nix
    ../../modules/commands/git.nix
    ../../modules/commands/nushell.nix
    ../../modules/commands/shell.nix
    ../../modules/commands/software.nix
    ../../modules/commands/ssh.nix

    # Desktop
    ../../modules/desktop/aerospace.nix
    ../../modules/desktop/hammerspoon.nix
    ../../modules/desktop/macos.nix
    ../../modules/desktop/sketchybar.nix
  ];

  networking.hostName = "RTS";
}
