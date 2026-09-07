{ pkgs, ... }:

{
  # nix-ld: dynamic linker that lets unpatched (prebuilt) binaries find
  # system libraries in the nix store. NixOS has no global /usr/lib, so
  # Electron/Chromium desktop apps (Hermes, etc.) fail with "cannot open
  # shared object file" unless the libs they link against are exposed here.
  #
  # The default library list is minimal, so we add the full set required by
  # Electron/Chromium apps.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      glib
      gtk3
      nss
      nspr
      atk
      at-spi2-atk
      at-spi2-core
      cups
      dbus
      cairo
      pango
      mesa
      libgbm
      udev
      alsa-lib
      libxkbcommon
      expat
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxcb
      libxcursor
      libxi
      libxrender
      fontconfig
      freetype
      libdrm
    ];
  };
}