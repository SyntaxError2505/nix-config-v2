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

    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
        dnsmasq
        virtiofsd
    ];
}
