{ config, pkgs, inputs, host, ... }:

{
  imports = 
  [
    ./max/programs.nix
    
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

  programs = {
    home-manager.enable = true;
  };
}
