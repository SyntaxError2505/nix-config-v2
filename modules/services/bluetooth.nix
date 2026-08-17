{}:
{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings.general = {
    Experimental = true;
    FastConnectable = true;
    Enable = "Source,Sink,Media,Socket";
  };
  services.blueman.enable = true;
}
