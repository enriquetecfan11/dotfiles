"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,php,python,ruby"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'gruvbox-community/gruvbox'


" Nerdtree
let NERDTreeQuitOnOpen=0
let NERDTreeWinSize=35
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinPos = "left"

autocmd VimEnter * NERDTree


"*****************************************************************************
" General Settings
"*****************************************************************************

" enables syntax highlighting
syntax on

" Better colors
set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number

" columns used for the line number
set numberwidth=4

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

colorscheme onehalfdark

" Enable mouse use in all modes
set mouse=a

let g:python_highlight_all = 1
let g:html_highlight_all = 1
let g:javascript_highlight_all = 1
