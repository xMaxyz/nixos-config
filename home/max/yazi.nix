{ pkgs, config, lib, ... }:
let
  hex = lib.concatStrings;
  y = config.my.host.ui.apps.yazi;
in
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    settings = {
      mgr = {
        ratio = [ 1 3 4 ];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = true;
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
      };
      preview.wrap = "no";
      opener = {
        xdg = [
          {
            run = "xdg-open \"$@\"";
            desc = "System Open";
          }
        ];
      };
      open = {
        rules = [
          { mime = "*"; use = "xdg"; }
        ];
      };
    };
    
    theme = {
      filetype = {
        rules = [
          { mime = "image/*"; fg = (hex y.mime.image.any); }
	        { mime = "video/*"; fg = (hex y.mime.video.any); }
	        { mime = "audio/*"; fg = (hex y.mime.audio.any); }
	        { mime = "inode/empty"; fg = y.mime.inode.empty; }
	        { mime = "text/plain"; fg = y.mime.text.plain; }
	        { url = "*/"; fg = (hex y.mime.dir); }
        ];
      };
    };
  };
}