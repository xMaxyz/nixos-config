{ pkgs, config, ... }:

{
  users.users."max" = {
    isNormalUser = true;
    description = "max";
    extraGroups = [ "networkmanager" "wheel" "max" "audio" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  users.users."test" = {
    isNormalUser = true;
    description = "test";
    extraGroups = [ "networkmanager" "wheel" "test" "audio" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  users.defaultUserShell = pkgs.zsh;
}