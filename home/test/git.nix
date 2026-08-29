{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Max Goedecke";
      user.email = "max_goedecke@gmx.de";
    };
  };
}