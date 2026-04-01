{ settings, ... }:

{
  home-manager.users.${settings.account.name}.programs.git = {
    enable = true;
    ignores = [
      "**/.claude/settings.local.json"
    ];
  };
}
