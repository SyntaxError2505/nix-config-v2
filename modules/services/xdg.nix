{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config = {
      common.default = [ "gtk" ];
      niri = {
        default = [ "gtk" ];
      };
      hyprland.default = [ "hyprland" "gtk" ];
      kde.default = [ "kde" "gtk" ];
    };
  };
}
