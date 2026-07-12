{ config, pkgs, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";
  home.stateVersion = "26.05";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
  };

  home.packages = with pkgs; [
    vim
    fuzzel
    vscodium
    kitty
    quickshell
    btop
    fastfetch
    tree
    curl
    vlc
    mpv
  ];


  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        la = "ls -a --color=auto";
        ll = "ls -la --color=auto";
        n = "nano";
        cls = "clear";
        v = "vim";
        gitlog = "git log --oneline";
      };

      history = {
        size = 10000;
        save = 10000;
        path = "${config.home.homeDirectory}/.zsh_history";
      };

      initExtra = ''
        PROMPT="%F{#ff803b}%#%f %F{#faa768}%2~%f %F{#cdd6f4}>%f "
        RPROMPT=""
      '';

      autosuggestion.enable = true;
    };

    niri = {
      enable = true;
    };

    git = {
      enable = true;
      config = {
        user = {
          name = "Max Goedecke";
          email = "max_goedecke@gmx.de";
        };
      };
    };

    firefox.enable = true;
    xdg.enable = true;
  }
}