{ ... }:

{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "uninstall";
    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';
    taps = [ "nikitabobko/tap" ];
    brews = [
      "borders"
      "gogcli"
      "m-cli"
      "obsidian-cli"
      "remindctl"
      "skhd"
      "sketchybar"
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
    masApps = { };
  };
}
