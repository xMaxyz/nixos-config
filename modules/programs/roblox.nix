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
        args = "--gpg-import=${pkgs.fetchurl {
          url = "https://flathub.org";
          sha256 = "17snr80h5hcrwnmvrfsw5ch1v0l59p9nsa4x5563nfs6sw7hvs1g";
        }}";
      }];

      packages = [
        "org.vinegartq.Sober"
      ];
    };
  };
}