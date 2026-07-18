{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "auto";
        hide-before-typing = false;
        fields = "filename,name,generic";
        password-character = "*";
        match-mode = "fzf";
        sort-result = true;
        show-actions = false;
        terminal = "";
        list-executables-in-path = false;
        anchor = "center";
        gamma-correct-blending = true;
        layer = "overlay";
        keyboard-focus = "exclusive";
        exit-on-keyboard-focus-loss = true;
        enable-mouse = false;
        font = "${config.my.theme.global.font}";
        prompt = "> ";
        placeholder = "";
        icon-theme = "default";
        icons-enabled = true;
        use-bold = false;
      };

      colors = {
        background = "${config.my.theme.fuzzel.background}";
        text = "${config.my.theme.fuzzel.text}";
        prompt = "${config.my.theme.fuzzel.prompt}";
        input = "${config.my.theme.fuzzel.input}";
        match = "${config.my.theme.fuzzel.match}";
        selection = "${config.my.theme.fuzzel.selection}";
        selection-text = "${config.my.theme.fuzzel.selection-text}";
        selection-match = "${config.my.theme.fuzzel.selection-match}";
        border = "${config.my.theme.fuzzel.border}";
      };
    };
  };
}