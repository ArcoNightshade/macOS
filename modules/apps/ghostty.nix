{ settings, ... }:

{
  home-manager.users.${settings.account.name}.programs.ghostty = {
    enable = true;
    settings = {
      font-size = 19;
      background-blur-radius = 20;
      mouse-hide-while-typing = true;
      window-decoration = false;
      macos-option-as-alt = true;
      background-opacity = 0.4;
    };
  };
}
