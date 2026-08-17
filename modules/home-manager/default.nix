{ config, ... }:

{
    home-manager.users.sascha = {
        imports = [ 
            ./alacritty.nix
        ];
        home.stateVersion = config.system.stateVersion;
    };
}
