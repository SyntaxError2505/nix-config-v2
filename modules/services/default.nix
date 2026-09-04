{ ... }:

{
    imports = [
        ./networking.nix
        ./bluetooth.nix
        ./pipewire.nix
        ./xdg.nix
        ./tailscale.nix
        ./printing.nix
        ./samba.nix
        ./a11y.nix
    ];
}
