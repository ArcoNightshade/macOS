{ ... }:

{
  # Include extra architecture for cross-compilation
  nix.extraOptions = ''
    extra-platforms = aarch64-darwin x86_64-darwin
  '';
}
