{ config, ... }:

{
    home-manager.users.sascha = {
        imports = [
            ./hyprland.nix
            ./niri.nix
        ];
        home.stateVersion = config.system.stateVersion;
    };
}
