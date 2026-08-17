{ pkgs, ... }:

{
    programs.niri.enable = true;
    services.displayManager.gdm.enable = true;

    environment.systemPackages = with pkgs; [
        fuzzel
        noctalia-shell
        brightnessctl
    ];
}
