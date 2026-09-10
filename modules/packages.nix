{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    btop
    fastfetch
    vlc
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
