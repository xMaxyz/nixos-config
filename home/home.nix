{ config, pkgs, inputs, host, ... }:

{
  imports = 
  [
    #functional
    ../modules/theme-options.nix
    ../themes/current.nix
    ../hosts/${host}/ui.nix

    #front-end
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
    quickshell
    dunst
    firefox
    dolphin-emu
    kid3
    tipp10

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
    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        background_opacity = "0.6";
        font_size = "11.0";
        confirm_os_window_close = "0";
        enable_audio_bell = false;
      };
    };
  };
}
