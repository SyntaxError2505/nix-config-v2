{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    btop
    fastfetch
    obsidian
    onlyoffice-desktopeditors
    vlc
    nautilus
    extremetuxracer
    kdePackages.kdeconnect-kde
    unzip
    noctalia-shell
    tmux
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];
}
