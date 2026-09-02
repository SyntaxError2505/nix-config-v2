{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake /etc/nixos#${config.networking.hostName}";
      nup = "sudo nix flake update --flake /etc/nixos";
    };
  };

  users.users.sascha.shell = pkgs.fish;
}
