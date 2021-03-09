" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Automatic installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vimtex setup
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" ultisnips setup
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'lecture-notes']

" tex-conceal setup
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
set conceallevel=2
let g:tex_conceal='abdmg'
hi Conceal ctermbg=NONE
hi Conceal ctermfg=NONE
hi Conceal guifg=NONE
hi Conceal guibg=NONE

" surround
Plug 'tpope/vim-surround'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

" vim-ctrlspace
Plug 'vim-ctrlspace/vim-ctrlspace'
set hidden
set encoding=utf-8
let g:CtrlSpaceSaveWorkspaceOnSwitch=1
let g:CtrlSpaceSaveWorkspaceOnExit=1
set showtabline=0
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Initialize plugin system
call plug#end()

" Necessary for lots of cool vim things
set nocompatible

" Vim Config configurations
"" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
" set textwidth=100   " Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set spell	    " Enable spell-checking
set visualbell	    " Use visual bell (no beeping)
 
set smartcase	    " Enable smart-case search
set incsearch	    " Searches for strings incrementally
 
set shiftwidth=4    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
 
"" Advanced
set ruler	    " Show row and column ruler information
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
 
"" Generated by VimConfig.com

colorscheme monokai-soda

" setup netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_list_hide=netrw_gitignore#Hide()
