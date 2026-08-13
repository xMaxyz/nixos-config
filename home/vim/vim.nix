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
      set clipboard=unnamedplus

      set termguicolors

      " Mappings
      inoremap jk <Esc>

      inoremap ( ()<Left>
      inoremap [ []<Left>
      inoremap { {}<Left>
      inoremap " ""<Left>
      inoremap ' '''<Left>
      inoremap ''' ''''''<Left><Left>

      inoremap (<CR> (<CR>)<Esc>O
      inoremap [<CR> [<CR>]<Esc>O
      inoremap {<CR> {<CR>}<Esc>O
      inoremap "<CR> "<CR>"<ESC>O
      inoremap '<CR> '<CR>'<Esc>O
      inoremap '''<CR> '''<CR>'''<Esc>O

      colorscheme everforest

      let g:indentLine_char = "│"
      let g:indentLine_defaultGroup = "SpecialKey"
      autocmd ColorScheme * highlight Conceal ctermfg=NONE guifg=#${config.my.host.ui.global.accent}
      autocmd ColorScheme * highlight CursorLineNr ctermfg=NONE guifg=#${config.my.host.ui.global.accent}
      
    '';

    plugins = with pkgs.vimPlugins; [
      vim-wordmotion
      vim-surround
      targets-vim
      vim-gitgutter
      indentLine
      vim-polyglot
      everforest
    ];
  };
}
