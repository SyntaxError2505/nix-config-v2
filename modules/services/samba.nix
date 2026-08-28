{ pkgs, ... }:

{
  # Enable GVfs, which provides the SMB/CIFS backend used by Nautilus.
  services.gvfs.enable = true;

  # Samba client tools and libraries. GVfs picks these up so Nautilus can
  # browse smb://server/share URLs and authenticate against Windows/SMB shares.
  environment.systemPackages = with pkgs; [ samba ];

  # Discover SMB servers on the local network in Nautilus (Other Locations).
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
