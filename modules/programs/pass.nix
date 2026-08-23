{ config, pkgs, ... }:

{
  imports = [
    ../services/gnupg.nix
  ];
  
  home-manager.users.max = { config, pkgs, ... }: {
    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [
        exts.pass-otp
        exts.pass-import
      ]);
    
      settings = {
        PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
      };
    };
  };
}