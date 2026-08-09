{ lib, host, ... }:

{
  imports = [
    ../../themes/current.nix
    ../../hosts/${host}/ui.nix
  ];

  options.my.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Theme that is NOT host-specific";
  };

  options.my.ui = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "UI sizes that are referenced by config.my.ui and entirely host-specific";
  };
}
