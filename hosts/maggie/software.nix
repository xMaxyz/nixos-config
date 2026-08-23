{ pkgs, ... }:

{
  imports = [
    ../../modules/services/alt-win-switch.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

  programs = {};
}