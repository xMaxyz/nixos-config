{ pkgs, host, lib, config, ... }:

{
  options.my.host.programs.hosts.roblox = lib.mkOption {
    description = "hosts on which roblox shall be installed on";
    default = [];
    type = lib.types.listOf lib.types.str;
  };

  config = lib.mkIf (lib.elem host config.my.host.programs.hosts.roblox) {
    services.flatpak = {
      enable = true;

      remotes = [{
        name = "flathub";
        location = "https://flathub.org";
        # Hier nutzen wir den vom Modul vorgeschlagenen Namen:
        gpg-import = pkgs.fetchurl {
          url = "https://flathub.org";
          hash = "sha256-govGILbUH/VYAq5yp4keD+GCj3CzmlZ2NSqKzecu3Eo=";
        };
      }];


      packages = [
        "org.vinegartq.Sober"
      ];
    };
  };
}