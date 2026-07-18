{ pkgs, config, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
    };

    extraConfig = ''
      set nocompatible

      filetype on
      filetype plugin on
      filetype indent on

      syntax on
      set cursorline

      set smartcase
      set showmode
      set hlsearch

      set autoindent
      set smartindent
      filetype plugin indent on

      " Mappings
      inoremap jk <Esc>

      inoremap ( ()<Left>
      inoremap [ []<Left>
      inoremap { {}<Left>
      inoremap ' \'''\'<Left>
      inoremap \'''\' \'''\'\'<Left><Left>
      inoremap " ""<Left>

      inoremap (<CR> (<CR>)<Esc>O
      inoremap [<CR> [<CR>]<Esc>O
      inoremap {<CR> {<CR>}<Esc>O
      inoremap \'''\'<CR> \'''\'<CR>\'''\'<Esc>O
    '';

    plugins = with pkgs.vimPlugins; [
      vim-wordmotion
      vim-surround
      targets-vim
      vim-gitgutter
    ];
  };
}
