{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    kitty
    btop
    fastfetch
    obsidian
    onlyoffice-desktopeditors
    git
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
    tmux
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];
}
