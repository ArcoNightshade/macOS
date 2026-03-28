{ config, pkgs, ... }:

{
  #package config
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  programs.nix-index.enable = true;

  ids.gids.nixbld = 350;

  # add nerd fonts
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
  ];

  # Set primary user for system defaults
  system.primaryUser = "lyon";

  #system-defaults.nix
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "bottom";
      showhidden = true;
      mineffect = "genie";
      launchanim = true;
      show-process-indicators = true;
      tilesize = 48;
      static-only = true;
      mru-spaces = false;
      show-recents = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      CreateDesktop = false; # disable desktop icons
    };
    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
      Dragging = true;
    };
    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark"; # set dark mode
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      _HIHideMenuBar = true; # autohide top panel
    };
  };

  # Firewall
  networking.applicationFirewall.enable = true;
  networking.applicationFirewall.blockAllIncoming = true;
  networking.applicationFirewall.enableStealthMode = true;

  # CLI tools (moved from brew)
  environment.systemPackages = with pkgs; [
    aircrack-ng
    btop
    # cava  # currently broken on nixpkgs-unstable
    cheat
    curl
    elixir
    erlang
    fastfetch
    ffmpeg
    fzf
    gcc
    gh
    git
    hashcat
    john
    lld
    llvm
    lua
    mas
    nmap
    nodejs
    nushell
    odin
    onefetch
    openjdk
    python3
    qemu
    raylib
    rustup
    _7zz
    signal-cli
    stow
    tokei
    uutils-coreutils
    zsh
  ];

   # Add flake support
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
