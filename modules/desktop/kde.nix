{ ... }:

{
    imports = [
        ../services/tailscale.nix
        ../services/xdg.nix
    ];
    services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;

