{ pkgs, ... }:

{
    virtualisation.libvirtd = {
        enable = true;
        qemu.runAsRoot = true;
    };

    programs.virt-manager.enable = true;

    users.users.YOUR_USERNAME.extraGroups = [
        "libvirtd"
        "kvm"
    ];


    environment.systemPackages = with pkgs; [
        dnsmasq
        virtiofsd
    ];
}
