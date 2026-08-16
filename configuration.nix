# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.tuxedo-drivers.settings.charging-profile = "stationary";

  programs.nix-ld.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings.general = {
    Experimental = true;
    FastConnectable = true;
    Enable = "Source,Sink,Media,Socket";
  };
  services.blueman.enable = true;

  programs.hyprland.enable = true;
  services.displayManager.gdm.enable = true;
  programs.waybar.enable = true;
  services.dunst.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.bash.shellAliases = {
    ns = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nup = "sudo nix flake update --flake /etc/nixos";
  };

  time.timeZone = "Europe/Berlin";
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;

  services.playerctld.enable = true;

  # Lets noctalia see battery
  services.upower.enable = true;

  users.users.sascha = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    kitty
    brave
    hyprlauncher
    btop
    fastfetch
    obsidian
    onlyoffice-desktopeditors
    hyprpaper
    git
    brightnessctl
    vlc
    nautilus
    hyprshot
    pavucontrol
    gh
    lazygit
    emacs
    extremetuxracer
    kdePackages.kdeconnect-kde
    cargo
    unzip
    gnumake
    zed-editor
    noctalia-shell
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;
  networking.firewall.enable = false;
  services.power-profiles-daemon.enable = true;
  services.flatpak.enable = true;

  # just don't change pls
  system.stateVersion = "26.05"; # Did you read the comment?

}

