{ pkgs, ... }:

{
  imports = [
    ../hardware/pipewire.nix #for sound
  ];

  environment.systemPackages = with pkgs; [
    zrythm

    #plugins
    vital
    lsp-plugins
    calf
  ];
}