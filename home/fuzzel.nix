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
        background = "${config.my.theme.custom.fuzzel.background}";
        text = "${config.my.theme.custom.fuzzel.text}";
        prompt = "${config.my.theme.custom.fuzzel.prompt}";
        input = "${config.my.theme.custom.fuzzel.input}";
        match = "${config.my.theme.custom.fuzzel.match}";
        selection = "${config.my.theme.custom.fuzzel.selection}";
        selection-text = "${config.my.theme.custom.fuzzel.selection-text}";
        selection-match = "${config.my.theme.custom.fuzzel.selection-match}";
        border = "${config.my.theme.custom.fuzzel.border}";
      };
    };
  };
}