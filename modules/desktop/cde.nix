{ pkgs, ... }:

{
    imports = [
        ../services
    ];

    services.xserver.enable = true;
    services.xserver.desktopManager.cde.enable = true;
}
