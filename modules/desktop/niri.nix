{ pkgs, ... }:

{
    programs.niri.enable = true;
    services.displayManager.gdm.enable = true;
    environment.sessionVariables.XDG_CURRENT_DESKTOP = "niri";

    environment.systemPackages = with pkgs; [
        fuzzel
        noctalia-shell
        brightnessctl
        # niri does not like straight xwayland?
        xwayland-satelite
    ];
}
