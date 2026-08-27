{ ... }:

{
    imports = [
        ../services/tailscale.nix
        ../services/xdg.nix
        ../services/networking.nix
        ../services/bluetooth.nix
    ];
    services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;
}
