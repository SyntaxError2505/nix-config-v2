{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        git
        gh
        lazygit
        cargo
        gnumake
        emacs
        gcc
        python3
        vim
        nodejs
        opencode
    ];
}
