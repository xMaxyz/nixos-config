{ config, pkgs, inputs, host, ... }:

{
  imports = 
  [
    ./test/current-theme.nix
    ./test/programs.nix
    
    ./test/zsh.nix
    ./test/git.nix
    ./test/fuzzel.nix
    ./test/dunst.nix
    ./test/niri.nix
    ./test/quickshell.nix
    ./test/yazi.nix
    ./test/vim.nix
    ./test/fastfetch.nix
    ./test/kitty.nix
  ];
  
  home.username = "test";
  home.homeDirectory = "/home/test";
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
