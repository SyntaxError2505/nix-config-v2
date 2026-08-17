{ config, lib, pkgs, ... }:

{
  imports = [
    ./apps/grub.nix
    ./services
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.nix-ld.enable = true;

  programs.bash.shellAliases = {
    ns = "sudo nixos-rebuild switch --flake /etc/nixos#${config.networking.hostName}";
    nup = "sudo nix flake update --flake /etc/nixos";
  };

  time.timeZone = "Europe/Berlin";
  services.printing.enable = true;
  services.libinput.enable = true;
  services.playerctld.enable = true;

  # Lets noctalia see battery
  services.upower.enable = true;

  users.users.sascha = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;
  networking.firewall.enable = false;
  services.power-profiles-daemon.enable = true;
  services.flatpak.enable = true;

  programs.firefox.enable = true;

  # just don't change pls
  system.stateVersion = "26.05"; # Did you read the comment?
}
