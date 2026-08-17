{ config, lib, pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.displayManager.gdm.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpaper
    hyprshot
    pavucontrol
    brightnessctl
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
