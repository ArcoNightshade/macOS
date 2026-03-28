{ config, ... }:

{
  #homebrew packages
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    brews = [
      "borders"
      "gogcli"
      "m-cli"
      "memo"
      "obsidian-cli"
      "remindctl"
      "skhd"
      "sketchybar"
      "supabase"
    ];
    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';
    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
    ];
    casks = [
      "aerospace"
      "ghostty"
      "raycast"
      "vlc"
      "anaconda"
      "github"
      "signal"
      "vscodium"
      "docker-desktop"
      "libreoffice"
      "tidal"
      "zed"
      "claude-code"
      "firefox"
      "obsidian"
      "vesktop"
      "zenmap"
    ];
    masApps = {
      DaisyDisk = 411643860;
      Vimari = 1480933944;
      "WiFi Explorer" = 494803304;
      "Reeder 5." = 1529448980;
      "Okta Extension App" = 1439967473;
    };
  };
}
