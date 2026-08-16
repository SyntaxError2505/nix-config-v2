{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/packages.nix
    # Swap this import to change the desktop environment
    ../../modules/desktop/hyprland.nix
  ];

  networking.hostName = "thinkpad";

  hardware.tuxedo-drivers.settings.charging-profile = "stationary";
}
