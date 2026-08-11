{ config, lib, ... }:

let 
  
  alphaChannelType = lib.types.strMatching "^[0-9a-f]{2}$";
  numbersign = lib.types.enum [ "#" ];

  unhashedRgbType = lib.types.strMatching "^[0-9a-f]{6}$";
  unhashedRgbaType = lib.types.tuple [ unhashedRgbType alphaChannelType ]; 
  unhashedArgbType = lib.types.tuple [ alphaChannelType unhashedRgbType ]; #typically used by quickshell

  hashedRgbType = lib.types.tuple [ numbersign unhashedRgbType ];
  hashedRgbaType = lib.types.tuple [ numbersign unhashedRgbType alphaChannelType ];
  hashedArgbType = lib.types.tuple [ numbersign alphaChannelType unhashedRgbType ];

  colorNameType = lib.types.enum [ "white" "black" "blue" "yellow" "red" "green" "gray" "purple" ];
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
                      type = unhashedRgbType;
                    };
                    radius = lib.mkOption {
                      description = "unified border radius of ui rectangles";
                      default = 10;
                      type = lib.types.ints.unsigned;
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
                            type = unhashedRgbType;
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
                                inactive-color = lib.mkOption { default = [ "#" "aaaaaa" "ff" ]; type = hashedRgbaType; };
                                urgent-color = lib.mkOption { default = [ "#" "ff0000" "ff" ]; type = hashedRgbaType; };
                                active-gradient = lib.mkOption {
                                  default = null;
                                  type = lib.types.nullOr (lib.types.tuple [ hashedRgbaType hashedRgbaType ]); # [ [ "# ""rgb" "a" ] [ "#" "rgb" "a" ] ]
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
                          menubar = lib.mkOption {
                            description = "config for quickshell's menubar";
                            default = {};
                            type = lib.types.submodule {
                              options = {
                                box = lib.mkOption {
                                  description = "dimensions of each element in menubar";
                                  default = {};
                                  type = lib.types.submodule {
                                    options = {
                                      width = lib.mkOption { type = lib.types.ints.unsigned; default = 70; };
                                      height = lib.mkOption { type = lib.types.ints.unsigned; default = 40; };
                                      radius = lib.mkOption { type = lib.types.ints.unsigned; default = 10; };
                                      background = lib.mkOption { type = hashedArgbType; default = [ "#" "d0" "ffffff" ]; };
                                    };
                                  };
                                };
                                text = lib.mkOption {
                                  description = "text formatting for menubar";
                                  default = {};
                                  type = lib.types.submodule {
                                    options = {
                                      color = lib.mkOption { type = hashedArgbType; default = [ "#" "ff" "ffffff" ]; };
                                      size = lib.mkOption { type = lib.types.ints.unsigned; default = 10; };
                                    };
                                  };
                                };
                              };
                            };
                          };

                          widget = lib.mkOption {
                            description = "config for quickshell widgets";
                            default = {};
                            type = lib.types.submodule {
                              options = {
                                clock = lib.mkOption {
                                  description = "config for quickshell clock widget";
                                  default = {};
                                  type = lib.types.submodule {
                                    options = {
                                      box = lib.mkOption {
                                        description = "config for widget clock box";
                                        default = {};
                                        type = lib.types.submodule {
                                          options = {
                                            background = lib.mkOption { type = hashedArgbType; default = [ "#" "25" "000000" ]; };
                                            height = lib.mkOption { type = lib.types.ints.unsigned; default = 140; };
                                          };
                                        };
                                      };
                                      border = lib.mkOption {
                                        description = "config for border of clock widget";
                                        default = {};
                                        type = lib.types.submodule {
                                          options = {
                                            color = lib.mkOption { type = hashedArgbType; default = [ "#" "d0" "ffffff" ]; };
                                            width = lib.mkOption { type = lib.types.ints.unsigned; default = 1; };
                                          };
                                        };
                                      };
                                      text = lib.mkOption {
                                        description = "text formatting of clock widget";
                                        default = {};
                                        type = lib.types.submodule {
                                          options = {
                                            topColor = lib.mkOption { type = hashedArgbType; default = [ "#" "ff" "ffffff" ]; };
                                            topSize = lib.mkOption { type = lib.types.ints.unsigned; default = 34; };
                                            subColor = lib.mkOption { type = hashedArgbType; default = [ "#" "d0" "ffffff" ]; };
                                            subSize = lib.mkOption { type = lib.types.ints.unsigned; default = 13; };
                                          };
                                        };
                                      };
                                    };
                                  };
                                };
                                zonewidth = lib.mkOption { type = lib.types.numbers.between 0.0 1.0; default = 0.3; };

                              };
                            };
                          };
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