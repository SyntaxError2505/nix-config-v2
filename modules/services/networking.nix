{ ... }:
{
    services.openssh.enable = true;
    networking.firewall.enable = false;
    time.timeZone = "Europe/Berlin";
    networking.networkmanager.enable = true;
}
