{ ... }:

{
  # AT-SPI (Assistive Technology Service Provider Interface) bus.
  #
  # Pi's Linux UI tools (observe_ui / act_ui / find_roots / launch_browser)
  # need a running accessibility bus to read the desktop's UI tree. Without
  # this, browser / app automation is unavailable.
  #
  # We enable the upstream `services.gnome.at-spi2-core` module: it installs
  # at-spi2-core, registers its D-Bus activation files (`org.a11y.Bus`,
  # `org.a11y.atspi.Registry`) on the user session bus, and ships the
  # matching `at-spi-dbus-bus.service` user unit so the bus activates on
  # demand. Setting it to `true` also prevents the same module's disabled
  # branch from exporting `GTK_A11Y = "none"` / `NO_AT_BRIDGE = 1`, which
  # would otherwise force apps off the AT-SPI backend.
  services.gnome.at-spi2-core.enable = true;

  # Make GLib / Qt apps actually expose their UI over AT-SPI. We deliberately
  # don't set `GTK_A11Y` here — that's left at its distro default (`atspi`),
  # since GTK 3 reads it via GLib and overriding it collides with the
  # at-spi2-core module's branch logic.
  environment.sessionVariables = {
    ACCESSIBILITY_ENABLED = "1";
    QT_ACCESSIBILITY = "1";
  };
}
