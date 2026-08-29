{ config, pkgs, lib, host, ... }:

{ 
  options.myPrograms.pass.hosts = lib.mkOption {
    description = "hosts on which pass may be installed";
    default = [];
    type = lib.types.listOf lib.types.str;
  };
  
  config = lib.mkIf (lib.elem host config.myPrograms.pass.hosts) {
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