{ config, pkgs, lib, host, ... }:

{ 
  options.my.host.programs.hosts.pass = lib.mkOption {
    description = "hosts on which pass may be installed";
    default = [];
    type = lib.types.listOf lib.types.str;
  };
  
  config = lib.mkIf (lib.elem host config.my.host.programs.hosts.pass) {
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