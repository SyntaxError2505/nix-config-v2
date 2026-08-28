{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };

      niri = {
        default = [ "gnome" "gtk" ];
      };

      hyprland = {
        default = [ "hyprland" "gtk" ];
      };

      kde = {
        default = [ "kde" ];
      };

      plasma = {
        default = [ "kde" ];
      };
    };
  };
}
