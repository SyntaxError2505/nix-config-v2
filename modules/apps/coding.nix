{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        git
        gh
        lazygit
        cargo
        gnumake
        gcc
        python3
        vim
        nodejs
        opencode
    ];
}
