{ lib, ... }:

{
  options.my.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {};
  };
}