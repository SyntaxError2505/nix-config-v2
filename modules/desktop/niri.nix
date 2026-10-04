{ pkgs, ... }:

{
    imports = [
        ../services
    ];
    programs.niri.enable = true;
    services.displayManager.gdm.enable = true;
    environment.sessionVariables.XDG_CURRENT_DESKTOP = "niri";

    environment.systemPackages = with pkgs; [
        noctalia-shell
        brightnessctl
        xwayland-satellite
        grim         # region screenshots (Mod+S / Mod+Shift+S)
        slurp        # region selection for grim
        wl-clipboard # wl-copy
        libnotify    # notify-send feedback
    ];
}
