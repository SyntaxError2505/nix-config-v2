{ config, ... }:

{
    home-manager.users.sascha = {
        imports = [
            ./alacritty.nix
            ./hyprland.nix
            ./niri.nix
        ];
        home.stateVersion = config.system.stateVersion;
    };
}
