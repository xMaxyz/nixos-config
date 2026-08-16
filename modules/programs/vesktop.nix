{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs.unstable; [ vesktop ];
}