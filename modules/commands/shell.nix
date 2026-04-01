{ settings, ... }:

{
  environment.shellAliases = {
    nixrebuild = "sudo darwin-rebuild switch --flake /Users/${settings.account.name}/.lyon#workstation";
  };
}
