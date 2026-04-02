{
  description = "LyonOS Darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.3-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, lix-module, ... }:
    let
      settings = {
        timeZone = "America/New_York";
        account.name = "lyon";
      };
    in
    {
      darwinConfigurations = {
        # m3-macbook-air (lyon)
        "workstation" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs settings; };
          modules = [
            lix-module.nixosModules.default
            home-manager.darwinModules.home-manager
            ./profile/m3-macbook-air/hardware.nix
            ./profile/m3-macbook-air/configuration.nix
            ./compose.nix
          ];
        };
        # intel-macbook (used for CI to test updates)
        "intel-macbook" = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          specialArgs = { inherit inputs settings; };
          modules = [
            lix-module.nixosModules.default
            home-manager.darwinModules.home-manager
            ./profile/intel-macbook/hardware.nix
            ./profile/intel-macbook/configuration.nix
            ./compose.nix
          ];
        };
      };
    };
}
