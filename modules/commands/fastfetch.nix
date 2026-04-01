{ settings, ... }:

{
  home-manager.users.${settings.account.name}.xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
      "modules": [
        "title",
        "separator",
        "os",
        "host",
        "uptime",
        "packages",
        "wmtheme",
        "theme",
        "break",
        "colors"
      ]
    }
  '';
}
