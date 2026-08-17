{ pkgs, ... }:

{
    programs.niri.enable = true;
    services.displayManager.gdm.enable = true;
    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
        fuzzel
        noctalia-shell
        brightnessctl
    ];
}
