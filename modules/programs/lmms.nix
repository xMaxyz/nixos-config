{ pkgs, host, lib, config, ... }:

{
  options.myPrograms.lmms.hosts = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "hosts LMMS should be installed on";
  };

  config = lib.mkIf (lib.elem host config.myPrograms.lmms.hosts) {
    home.packages = with pkgs; [
      lmms

      #plugins
      vital
      lsp-plugins
      calf
    ];

    #make vital plugin recognisable for lmms
    home.file."Dokumente/lmms/plugins/vst/Vital.so".source = "${pkgs.vital}/lib/vst/Vital.so";
  };
}