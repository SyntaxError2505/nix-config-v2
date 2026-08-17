{ config, ... }:

{
    home-manager.users.sascha = {
        imports = [ 
            ./apps/alacritty.nix
        ];
        home.stateVersion = config.system.stateVersion;
    };
}
