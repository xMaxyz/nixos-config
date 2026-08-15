{ config, pkgs, inputs, host, ... }:

{
  imports = 
  [
    ./home/packages.nix
    
    ./home/zsh.nix
    ./home/git.nix
    ./home/fuzzel.nix
    ./home/dunst.nix
    ./home/niri.nix
    ./home/quickshell.nix
    ./home/yazi.nix
    ./home/vim.nix
    ./home/fastfetch.nix
    ./home/kitty.nix
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
