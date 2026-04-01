{
  pkgs,
  settings,
  lib,
  ...
}:

{
  # Nix settings
nix.extraOptions = ''
    experimental-features = nix-command flakes
    download-buffer-size = 524288000
  '';
  nix.settings = {
    trusted-users = [ "@admin" ];
    allowed-users = [ settings.account.name ];
    warn-dirty = false;
    auto-optimise-store = true;
  };

  nix.optimise.automatic = true;
  nix.optimise.interval = [ { Weekday = 5; } ]; # weekly, Friday

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
  home-manager.backupFileExtension = "bak";
  home-manager.useGlobalPkgs = true;
  home-manager.users.${settings.account.name} = {
    home.stateVersion = "24.11";
    home.username = settings.account.name;
    home.homeDirectory = lib.mkForce "/Users/${settings.account.name}";
    programs.home-manager.enable = true;
  };

  # Networking
  networking.knownNetworkServices = [
    "Wi-Fi"
    "Bluetooth PAN"
    "Thunderbolt Bridge"
  ];

  system.stateVersion = 4;
}
