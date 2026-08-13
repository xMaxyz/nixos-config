{ config, lib, ... }:
let
  f = config.my.host.ui.desktop.fuzzel;
  hex = lib.concatStrings;
in
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
        background = hex f.box.background;
        text = hex f.list.unselected.text;
        prompt = hex f.search.prompt;
        input = hex f.search.input;
        match = hex.list.unselected.match;
        selection = hex f.list.selected.background;
        selection-text = hex f.list.selected.text;
        selection-match = hex f.list.selected.match;
        border = hex f.box.border;
      };
    };
  };
}