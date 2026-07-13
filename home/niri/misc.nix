{ config, pkgs, ... }:

{
  programs.niri.settings = {
    hotkey-overlay = {
      skip-at-startup = true;
    };
    prefer-no-csd = true;
    screenshot-path = "~/Bilder/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
  };
}