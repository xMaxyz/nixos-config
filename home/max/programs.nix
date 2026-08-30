{ config, pkgs, ... }:

{
  
  #hosts for additional software
  my.host.programs.hosts = {
    pass = [ "nixie" "maggie" ];
    vesktop = [ "nixie" ];
    lmms = [ "nixie" ];
    roblox = [ "nixie" ];
  };

  imports = [
    ../../modules/programs/pass.nix #pass
    ../../modules/programs/vesktop.nix #vesktop
    ../../modules/programs/lmms.nix #LMMS
    ../../modules/programs/roblox.nix #roblox
  ];
  
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
    
    #media
    vlc
    mpv
    playerctl
    

    #fonts
    nerd-fonts.jetbrains-mono

    #depends
    wirelesstools #quickshell
    libnotify #send notifies
    xwayland-satellite #
    playerctl #music control


  ]) ++ (with pkgs.unstable; [  
    vscodium
    steam
  ]);
}