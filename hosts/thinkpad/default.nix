{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/packages.nix
    # Swap this import to change the desktop environment
    ../../modules/desktop/hyprland.nix
  ];

  networking.hostName = "thinkpad";

  systemd.tmpfiles.rules = [
    "w /sys/class/power_supply/BAT0/charge_control_start_threshold - - - - 75"
    "w /sys/class/power_supply/BAT0/charge_control_end_threshold   - - - - 80"
  ];

  hardware.tuxedo-drivers.settings.charging-profile = "stationary";
}
