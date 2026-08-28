{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lmms

    #plugins
    vital
    lsp-plugins
    calf
  ];

  #make vital plugin recognisable for lmms
  home.file."Dokumente/lmms/plugins/vst/Vital.so".source = "${pkgs.vital}/lib/vst/Vital.so";
}