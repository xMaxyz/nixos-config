{ pkgs, ... }:

{
  imports = [
    ../hardware/pipewire.nix #for sound
  ];

  environment.systemPackages = with pkgs; [
    lmms

    #plugins
    vital
    lsp-plugins
    calf
  ];

  home.file."Dokumente/lmms/plugins/vst/Vital.so".source = "${pkgs.vital}/lib/vst/Vital.so";
}