This is my personal Nix flake I use on my macbook.
Not really intended for anybody else to use.

## Requirements:

- Relatively modern MacOS version
- Lix installed: https://lix.systems/install/
- Nix-Darwin installed: https://github.com/LnL7/nix-darwin#install

## Quickstart:

Assuming you want to build the `workstation` output, you'd use these commands:

```
git clone https://github.com/ArcoNightshade/macOS
cd macOS
darwin-rebuild switch --flake .#workstation
``` 
