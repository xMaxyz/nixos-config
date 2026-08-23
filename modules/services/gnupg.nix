{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [ gnupg ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = false;
  };

}