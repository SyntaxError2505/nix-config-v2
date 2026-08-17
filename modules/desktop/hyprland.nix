{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.gdm.enable = true;

  environment.sessionVariables.XDG_CURRENT_DESKTOP = "Hyprland";

  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpaper
    hyprshot
    pavucontrol
    brightnessctl
  ];
}
