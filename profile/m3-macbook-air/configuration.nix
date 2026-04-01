{ ... }:

{
  imports = [
    ../../modules/apps/software.nix
    ../../modules/apps/zed.nix
    ../../modules/commands/software.nix
    ../../modules/commands/shell.nix
    ../../modules/desktop/macos.nix
  ];

  networking.hostName = "RTS";
}
