{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpaper
    hyprshot
    pavucontrol
    brightnessctl
  ];
}
