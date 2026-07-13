{ config, pkgs, inputs, ... }:

{
  imports = 
  [
    ../modules/theme-options.nix
    ../themes/current.nix
    ./zsh.nix
    ./git.nix
    ./fuzzel.nix
    ./dunst.nix
    ./niri.nix
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
    vim #editor
    vscodium #editor
    kitty #terminal
    quickshell #graphical shell
    btop #task manager
    fastfetch #cli info
    tree #cli info
    curl #download
    vlc #media player
    mpv #mediaplayer
    playerctl #cli media control
    wirelesstools #for quickshell to get name of wifi
    nerd-fonts.jetbrains-mono #font
    dunst #notify daemon
    libnotify #send notifies
  ];


  programs = {
    home-manager.enable = true;
    firefox.enable = true;
  };
}
