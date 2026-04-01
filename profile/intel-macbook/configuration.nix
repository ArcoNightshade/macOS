{ ... }:

# Used for GitHub Actions to test builds
{
  imports = [
    ../../modules/commands/software.nix
    ../../modules/commands/shell.nix
    ../../modules/desktop/macos.nix
  ];

  networking.hostName = "nix-mac-mini";
}
