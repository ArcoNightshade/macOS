{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.11";
  home.username = "lyon";
  home.homeDirectory = lib.mkForce "/Users/lyon";
}
