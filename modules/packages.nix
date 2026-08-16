{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    kitty
    btop
    fastfetch
    obsidian
    onlyoffice-desktopeditors
    git
    brightnessctl
    vlc
    nautilus
    gh
    lazygit
    emacs
    extremetuxracer
    kdePackages.kdeconnect-kde
    cargo
    unzip
    gnumake
    zed-editor
    noctalia-shell
    gcc
  ];
}
