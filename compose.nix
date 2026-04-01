{ pkgs, settings, lib, ... }:

{
  # Nix settings
  nix.package = pkgs.nix;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.settings = {
    trusted-users = [ "@admin" ];
    allowed-users = [ settings.account.name ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.nix-index.enable = true;
  ids.gids.nixbld = 350;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  # User
  system.primaryUser = settings.account.name;

  users.users.${settings.account.name} = {
    description = "Lyon";
    name = settings.account.name;
    shell = pkgs.nushell;
    packages = with pkgs; [
      bash
      gcc
      git
      gnupg
      tmux
    ];
  };

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.users.${settings.account.name} = {
    home.stateVersion = "24.11";
    home.username = settings.account.name;
    home.homeDirectory = lib.mkForce "/Users/${settings.account.name}";
    programs.home-manager.enable = true;
  };

  # Networking
  networking.knownNetworkServices = [ "Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge" ];

  system.stateVersion = 4;
}
