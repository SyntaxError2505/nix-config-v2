{ pkgs, ... }:

{
    imports = [
        ../services
    ];
    services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
        qt6Packages.qtstyleplugin-kvantum
    ];
}
