{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        pi-coding-agent
        git
        gh
        lazygit
        emacs
        cargo
        gnumake
        zed-editor
        gcc
        python3
        vim
    ];
}
