{ config, pkgs, inputs, ... }:

{
  imports = 
  [
    ../modules/theme-options.nix
    ../themes/current.nix
    ./zsh/zsh.nix
    ./git/git.nix
    ./fuzzel/fuzzel.nix
    ./dunst/dunst.nix
    ./niri/niri.nix
    ./quickshell/quickshell.nix
    ./yazi/yazi.nix
    ./vim/vim.nix
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
    kitty
    quickshell
    dunst
    firefox
    
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
    libnotify
    xwayland-satellite

  ]) ++ (with pkgs.unstable; [  
    #editors
    vscodium
    discord
    steam
  ]);


  programs = {
    home-manager.enable = true;
  };
}
