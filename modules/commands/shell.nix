{ settings, ... }:

{
  programs.bash.shellAliases = {
    nixrebuild = "sudo darwin-rebuild switch --flake /Users/${settings.account.name}/.lyon#workstation";
  };
}
