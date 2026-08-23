{ pkgs, ... }:

{
  imports = [
    ../services/pipewire.nix #for sound
  ];

  environment.systemPackages = with pkgs; [
    lmms

    #plugins
    vital
    lsp-plugins
    calf
  ];

  home-manager.users.max = { pkgs, ... }: {
    home.file."Dokumente/lmms/plugins/vst/Vital.so".source = "${pkgs.vital}/lib/vst/Vital.so";
  };

}