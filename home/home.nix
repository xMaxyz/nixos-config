{ config, pkgs, inputs, host, ... }:

{
  imports = 
  [
    ./zsh/zsh.nix
    ./git/git.nix
    ./fuzzel/fuzzel.nix
    ./dunst/dunst.nix
    ./niri/niri.nix
    ./quickshell/quickshell.nix
    ./yazi/yazi.nix
    ./vim/vim.nix
    ./fastfetch/fastfetch.nix
    ./kitty/kitty.nix
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
  };

  home.packages = (with pkgs; [
    #desktop
    quickshell #shell
    dunst #notify daemon
    firefox #browser
    kid3 #mp3 tagging
    tipp10
    kdePackages.dolphin #file manager
    kdePackages.elisa #music player
    thunderbird

    #info
    btop
    fastfetch
    tree
    
    #media
    vlc
    mpv
    playerctl

    #cli
    curl
    
    #fonts
    nerd-fonts.jetbrains-mono

    #depends
    wirelesstools #quickshell
    libnotify #send notifies
    xwayland-satellite #
    playerctl #music control


  ]) ++ (with pkgs.unstable; [  
    vscodium
    discord
    steam
  ]);


  programs = {
    home-manager.enable = true;
  };
}
