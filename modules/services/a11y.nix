{ pkgs, ... }:

{
  # Register at-spi2-core's D-Bus activation file so `org.a11y.Bus`
  # (the accessibility bus used by AT-SPI) becomes activatable on
  # demand. Without this, no client — including pi's Linux UI tools
  # (observe_ui / act_ui / find_roots) — can talk to AT-SPI.
  services.dbus.packages = [ pkgs.at-spi2-core ];
}
