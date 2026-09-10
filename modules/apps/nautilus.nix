{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    gvfs
    gvfs-smb
    samba
  ];

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
