{ ... }:
{
    services.openssh.enable = true;
    networking.firewall.enable = false;
    time.timeZone = "Europe/Berlin";
    services.printing.enable = true;
    networking.networkmanager.enable = true;
}
