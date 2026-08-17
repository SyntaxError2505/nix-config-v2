{
  description = "Sascha's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url="github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }: {
    # Every directory under ./hosts becomes a hostname
    nixosConfigurations = let
      hosts = builtins.attrNames (
        nixpkgs.lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./hosts)
      );

    in builtins.listToAttrs (map (name: {
      name = name;
      value = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/${name} ];
      };
    }) hosts);
  };
}
