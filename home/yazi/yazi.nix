{ pkgs, config, ... }:

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
          { mime = "image/*"; fg = "#${config.my.theme.yazi.color.mime.image.any}"; }
	        { mime = "video/*"; fg = "#${config.my.theme.yazi.color.mime.video.any}"; }
	        { mime = "audio/*"; fg = "#${config.my.theme.yazi.color.mime.audio.any}"; }
	        { mime = "inode/empty"; fg = "${config.my.theme.yazi.color.mime.inode.empty}"; }
	        { mime = "text/plain"; fg = "${config.my.theme.yazi.color.mime.text.plain}"; }
	        { url = "*/"; fg = "#${config.my.theme.yazi.color.mime.dir}"; }
        ];
      };
    };
  };
}