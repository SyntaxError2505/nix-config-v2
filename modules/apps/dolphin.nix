{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kio-admin
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
}
