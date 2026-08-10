{ config, lib, ... }:

let 
  hexColorType = lib.types.strMatching "^#?([0-9a-f]{1,6}|[0-9a-fA-F]{8})$";
  colorNameType = lib.types.enum [ "white" "black" "blue" "yellow" "red" "green" "gray" "purple" ];
  alphaChannelType = lib.types.strMatching "^[0-9a-f]{2}$";
in 
{
  options.my.host = lib.mkOption {
    description = "Unified host-wide configuration attribute set";
    default = {};
    type = lib.types.submodule {
      freeformType = lib.types.attrsOf lib.types.anything;
      options = {
        
        ui = lib.mkOption {
          description = "Unified system-wide visual configuration";
          default = {};
          type = lib.types.submodule {
            options = {

              global = lib.mkOption {
                description = "global core values used everywhere";
                default = {};
                type = lib.types.submodule {
                  options = {
                    accent = lib.mkOption {
                      description = "central color the theme is build around";
                      default = "0000ff";
                      type = hexColorType;
                    };
                    wallpaper = lib.mkOption {
                      description = "path to the wallpaper";
                      default = "file:///home/max/Bilder/.wallpaper/.fallback";
                      type = lib.types.str;
                    };
                    text = lib.mkOption {
                      description = "everything concerning normal text";
                      default = {};
                      type = lib.types.submodule {
                        options = {
                          foreground = lib.mkOption {
                            description = "color of normal, unformatted text";
                            default = "ffffff";
                            type = hexColorType;
                          };
                          subAlpha = lib.mkOption {
                            description = "Unified alpha-channel of RGBA/ARGB Code for subtext";
                            default = "d0";
                            type = alphaChannelType;

                          };
                          font = lib.mkOption {
                            description = "font used in all ui elements";
                            default = "JetBrainsMono Nerd Font";
                            type = lib.types.str;
                          };
                        };
                      };
                    };
                  };
                };
              };

              desktop = lib.mkOption {
                description = "configuration of desktop-essential apps";
                default = {};
                type = lib.types.submodule {
                  freeformType = lib.types.attrsOf lib.types.anything;
                  options = {
                    zsh = lib.mkOption {
                      description = "zsh specific config";
                      default = {};
                      type = lib.types.submodule {
                        options = {
                          prompt = lib.mkOption { default = "[%~]%# "; type = lib.types.str; };
                          rprompt = lib.mkOption { default = ""; type = lib.types.str; };
                        };
                      };
                    };

                    niri = lib.mkOption {
                      description = "niri specific config";
                      default = {};
                      type = lib.types.submodule {
                        options = {
                          border = lib.mkOption {
                            default = {};
                            type = lib.types.submodule {
                              options = {
                                inactive-color = lib.mkOption { default = "#aaaaaa"; type = hexColorType; };
                                urgent-color = lib.mkOption { default = "#ff0000"; type = hexColorType; };
                                active-gradient = lib.mkOption {
                                  default = [];
                                  type = lib.types.tuple [ hexColorType hexColorType ];
                                };
                              };
                            };
                          };
                        };
                      };
                    };

                    quickshell = lib.mkOption {
                      description = "quickshell specific config";
                      default = {};
                      type = lib.types.submodule {
                        options = {
                          
                        };
                      };
                    };
                  };
                };
              };

              apps = lib.mkOption {
                description = "app-specific configuration";
                default = {};
                type = lib.types.submodule {
                  freeformType = lib.types.attrsOf lib.types.anything;
                  options = {};
                };
              };

              dev = lib.mkOption {
                description = "attrs in development that yet need to be fully integrated";
                default = {};
                type = lib.types.submodule { freeformType = lib.types.attrsOf lib.types.anything; };
              };
            };
          };
        };
      };
    };
  };
}