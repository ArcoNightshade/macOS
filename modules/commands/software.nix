{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security
    aircrack-ng
    hashcat
    john
    nmap
    signal-cli

    # Dev
    elixir
    erlang
    gcc
    gh
    git
    lazygit
    lld
    llvm
    lua
    nodejs
    odin
    openjdk
    python3
    qemu
    raylib
    rustup

    # Utils
    _7zz
    btop
    cheat
    curl
    fastfetch
    ffmpeg
    fzf
    gnupg
    mas
    nil
    nixd
    nushell
    onefetch
    stow
    tokei
    zsh
  ];
}
