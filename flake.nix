{
  description = "Sascha's NixOS configuration";

  nixConfig = {
    extra-substituters = [ "https://kopuz.cachix.org" ];
    extra-trusted-public-keys = [
      "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kopuz.url = "github:temidaradev/kopuz";
  };

  outputs = { self, nixpkgs, home-manager, kopuz, ... }:
    let
      hosts = builtins.attrNames (
        nixpkgs.lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./hosts)
      );
    in
    {
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit kopuz; };
          modules = [
            ./hosts/${host}
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      }) hosts);
    };
}
