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
      uninstallUnmanaged = true;

      remotes = [{
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }];

      packages = [
        "org.vinegarhq.Sober"
      ];

      #opens Sober with XWayland for OpenGL 
      overrides = {
        "org.vinegarhq.Sober" = {
          Environment = {
            "DISPLAY" = ":0";
          };
        };
      };
    };
  };
}