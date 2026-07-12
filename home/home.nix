{ config, pkgs, ... }:

{
  imports = 
  [
    ../modules/theme-options.nix
    ../themes/current.nix
    ./zsh.nix
    ./git.nix
    ./fuzzel.nix
    ./dunst.nix
  ];
  
  home.username = "max";
  home.homeDirectory = "/home/max";
  home.stateVersion = "26.05";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    QML_IMPORT_PATH="/home/max/.dotfiles/working/quickshell/common:";
  };

  home.packages = with pkgs; [
    vim
    vscodium
    kitty
    quickshell
    btop
    fastfetch
    tree
    curl
    vlc
    mpv
    playerctl
    wirelesstools
    nerd-fonts.jetbrains-mono
  ];


  programs = {
    home-manager.enable = true;
    firefox.enable = true;
  };
}
