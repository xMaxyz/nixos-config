{ config, pkgs, ... }:
let 
  z = config.my.host.ui.desktop.zsh;
in
{
  programs.zsh = {
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

    initContent = ''
      PROMPT="${z.prompt}";
      RPROMPT="${z.rprompt}";
    '';

    autosuggestion.enable = true;
  };
}