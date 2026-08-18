{ pkgs, ... }:

{
    boot.kernelModules = [
        "kvm-intel"
        "kvm"
    ];
    
    virtualisation.libvirtd = {
        enable = true;
        qemu.runAsRoot = true;
    };

    programs.virt-manager.enable = true;

    users.users.sascha.extraGroups = [
        "libvirtd"
        "kvm"
    ];


    environment.systemPackages = with pkgs; [
        dnsmasq
        virtiofsd
    ];
}
