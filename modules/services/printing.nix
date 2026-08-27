{ ... }:

{
  services.printing = {
    enable = true;
    browsed.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
