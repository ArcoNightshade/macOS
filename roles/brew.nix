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
      "libreoffice"
      "tidal"
      "zed"
      "docker-desktop"
      "claude-code"
      "firefox"
      "obsidian"
      "vesktop"
      "zenmap"
    ];
    masApps = {
    };
  };
}
