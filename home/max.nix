{ config, pkgs, inputs, host, ... }:

{
  #modules to be inserted into HM-scope.
  imports = 
  [
    #imports the theme for this user. Don't change this.
    ./max/current-theme.nix
    
    #imports all the packages user-wide.
    ./max/programs.nix
    
    #all the files in ./max/
    #these are the configs for the "desktop" programs.
    #leaving one of these out will result in the program using its default settings.
    ./max/zsh.nix
    ./max/git.nix
    ./max/fuzzel.nix
    ./max/dunst.nix
    ./max/niri.nix
    ./max/quickshell.nix
    ./max/yazi.nix
    ./max/vim.nix
    ./max/fastfetch.nix
    ./max/kitty.nix
  ];
  
  #basic HM settings.
  #There is absolutely no reason to change this at all.
  home.username = "max";
  home.homeDirectory = "/home/max";
  home.stateVersion = "26.05";

  #enables the XDG-module that automatically sets all the XDG variables
  #home.sessionVariables seems to be deprecated.
  xdg.enable = true;

  #PATH extensions
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  #enables home manager. 
  #Do NOT turn this off as it would break user-scope for this user!
  programs = {
    home-manager.enable = true;
  };
}
