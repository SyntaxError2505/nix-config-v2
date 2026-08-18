{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kopuz
    ];
}
