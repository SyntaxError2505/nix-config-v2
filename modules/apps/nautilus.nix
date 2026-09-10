{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    (lib.mkForce gnome.gvfs)
    samba
  ];

  # GVfs must be running as a dbus daemon for Nautilus to browse smb:// and other virtual filesystems.
  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome.gvfs;
  };

  # NetBIOS name resolution and SMB network browsing (legacy Windows/SMB hosts).
  # smbd/winbindd are disabled because we only want discovery/client access, not sharing.
  services.samba = {
    enable = true;
    smbd.enable = false;
    winbindd.enable = false;
    nmbd.enable = true;
  };

  # Web Services Dynamic Discovery for modern Windows 10/11 hosts
  services.samba-wsdd = {
    enable = true;
    discovery = true;
    openFirewall = true;
  };

  # mDNS/DNS-SD service discovery used by Nautilus to discover SMB and NFS shares
  # on the local network (modern Windows, macOS, Linux NFS servers, etc.).
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
