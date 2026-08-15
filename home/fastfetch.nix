{ lib, config, pkgs, ... }:

let 
  hex = lib.concatStrings;
  f = config.my.host.ui.apps.fastfetch;
  g = config.my.host.ui.global;
in 

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        type = "auto";
        source = f.logo.source;
        color = {
          "1" = hex f.logo.color.secondary;
          "2" = hex f.logo.color.primary;
          "3" = hex f.logo.color.secondary;
          "4" = hex f.logo.color.primary;
          "5" = hex f.logo.color.secondary;
          "6" = hex f.logo.color.primary;
        };
        width = null;
        height = null;
        padding = {
          top = 0;
          left = 0;
          right = 4;
        };
        printRemaining = true;
        preserveAspectRatio = false;
        recache = false;
        position = "left";
        chafa = {
          fgOnly = false;
          symbols = "block+border+space-wide-inverted";
        };
      };

      display = {
        stat = false;
        pipe = false;
        showErrors = false;
        disableLinewrap = true;
        hideCursor = false;
        separator = ": ";
        color = {
          keys = hex f.display.keys;
          title = hex f.display.title;
          output = hex f.display.output;
          separator = "";
        };
        brightColor = true;
        duration = {
          abbreviation = false;
          spaceBeforeUnit = "default";
        };
        size = {
          maxPrefix = "YB";
          binaryPrefix = "iec";
          ndigits = 2;
          spaceBeforeUnit = "default";
        };
        temp = {
          unit = "D";
          ndigits = 1;
          color = {
            green = 32;
            yellow = 93;
            red = 91;
          };
          spaceBeforeUnit = "default";
        };
        percent = {
          type = [
            "num"
            "num-color"
          ];
          ndigits = 0;
          color = {
            green = 32;
            yellow = 93;
            red = 91;
          };
          spaceBeforeUnit = "default";
          width = 0;
        };
        bar = {
          char = {
            elapsed = "■";
            total = "-";
          };
          border = {
            left = "[ ";
            right = " ]";
            leftElapsed = "";
            rightElapsed = "";
          };
          color = {
            elapsed = "auto";
            total = 97;
            border = 97;
          };
          width = 10;
        };
        fraction = {
          ndigits = 2;
          trailingZeros = "default";
        };
        noBuffer = false;
        key = {
          width = 0;
          type = "string";
          paddingLeft = 0;
        };
        freq = {
          ndigits = 2;
          spaceBeforeUnit = "default";
        };
        constants = [];
      };
      general = {
        thread = true;
        processingTimeout = 5000;
        detectVersion = true;
        playerName = "";
        dsForceDrm = false;
      };
      modules = [
        {
          type = "title";
          key = " ";
          keyIcon = "";
          fqdn = false;
          color = {
            at = "";
            host = "";
            user = "";
          };
        }

        {
          type = "separator";
          string = "-";
          outputColor = "";
          times = 0;
        }

        {
          type = "os";
          keyIcon = "";
        }
    
        {
          type = "host";
          keyIcon = "󰌢";
        }
    
        {
          type = "kernel";
          keyIcon = "";
        }
    
        {
          type = "uptime";
          keyIcon = "";
        }

        {
          type = "packages";
          keyIcon = "󰏖";
          disabled = [ "apk" ];
          combined = false;
        }

        {
          type = "shell";
          keyIcon = "";
        }
    
        {
          type = "display";
          keyIcon = "󰍹";
          compactType = "none";
          preciseRefreshRate = false;
          order = null;
        }
    
        {
          type = "de";
          keyIcon = "";
        }
    
        {
          type = "wm";
          keyIcon = "";
          detectPlugin = true;
        }
    
        {
          type = "wmtheme";
          keyIcon = "󰓸";
        }
    
        {
          type = "theme";
          keyIcon = "󰉼";
        }
    
        {
          type = "icons";
          keyIcon = "";
        }
    
        {
          type = "font";
          keyIcon = "";
        }
    
        {
          type = "cursor";
          keyIcon = "󰆿";
        }
    
        {
          type = "terminal";
          keyIcon = "";
        }
    
        {
          type = "terminalfont";
          keyIcon = "";
        }
    
        {
          type = "cpu";
          keyIcon = "";
          temp = false;
          showPeCoreCount = false;
          tempSensor = "";
        }
    
        {
          type = "gpu";
          keyIcon = "󰾲";
          driverSpecific = false;
          detectionMethod = "pci";
          temp = false;
          hideType = "none";
          percent = {
            green = 50;
            yellow = 80;
            type = 0;
          };
        }
    
        {
          type = "memory";
          keyIcon = "";
          percent = {
            green = 50;
            yellow = 80;
            type = 0;
          };
        }
    
        {
          type = "swap";
          percent = {
            green = 50;
            yellow = 80;
            type = 0;
          };
          keyIcon = "󰓡";
          separate = false;
        }
    
        {
          type = "disk";
          keyIcon = "";
          showRegular = true;
          showExternal = true;
          showHidden = false;
          showSubvolumes = false;
          showReadOnly = true;
          showUnknown = false;
          folders = "";
          hideFolders = "/efi:/boot:/boot/*";
          hideFS = "";
          useAvailable = false;
          percent = {
            green = 50;
            yellow = 80;
            type = 0;
          };
        }
    
        {
          type = "localip";
          keyIcon = "󰩟";
          showIpv4 = true;
          showIpv6 = false;
          showMac = false;
          showLoop = false;
          showPrefixLen = true;
          showMtu = false;
          showSpeed = false;
          showFlags = false;
          compact = false;
          defaultRouteOnly = true;
          showAllIps = false;
          namePrefix = "";
        }
    
        {
          type = "battery";
          keyIcon = "";
          temp = false;
          percent = {
            green = 50;
            yellow = 20;
            type = 0;
          };
        }
    
        {
          type = "poweradapter";
          keyIcon = "󰚥";
        }
    
        {
          type = "locale";
          keyIcon = "";
        }
    
        "break"
    
        {
          type = "colors";
          key = " ";
          keyIcon = "";
          symbol = "circle";
          paddingLeft = 0;
          block = {
            width = 5;
            range = [ 0 15 ];
          };
          brightness = "default";
        }
      ];
    };
  };
}