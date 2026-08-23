{ pkgs, ... }:

{
  imports = [
    ../../modules/programs/pass.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

  programs = {};
}