{ lib, ... }:

{
  options.my.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Entire theme including ui sizes";
  };

  options.my.ui = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "UI sizes that are referenced by config.my.theme";
  };
}
