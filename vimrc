set nocompatible
filetype off

set wrap
set linebreak
set nolist
set tw=0
set showbreak=+++ " wrap-broken line prefix
set showmatch " highlight matching brace
set colorcolumn=80
set hlsearch  " highlight all search results
set smartcase " enable smart-case search
set ignorecase  " always case-insensitive
set incsearch " searches for strings incrementally

"" Advanced
set ruler " Show row and column ruler information

set undolevels=1000 " Number of undo levels

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'sjbach/lusty'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sheerun/vim-polyglot'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/gitignore'
Plugin 'rust-lang/rust.vim'
Plugin 'lifepillar/vim-wwdc16-theme'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

let g:go_fmt_options = "gofmt"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_quiet_messages = { "regex": 'invalid-name\|missing-docstring' }

" vim-airline
let g:airline_theme = 'base16_google'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_z=''
"let g:airline_powerline_fonts = 1
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⎇' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
endif
let g:tmux_navigator_disable_when_zoomed = 1

set autoindent  " auto-indent new lines
set expandtab " use spaces instead of tabs
set shiftwidth=2  " number of auto-indent spaces
set smartindent " enable smart-indent
set smarttab  " enable smart-tabs
set softtabstop=2 " number of spaces per Tab
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cR>

" Set Theme
colorscheme wwdc16
set bg=dark

" Don't create annoying files
set nobackup
set noswapfile

" Enable color syntaxing
syntax on

" Enable hidden buffer
set hidden

let mapleader = "\<space>"

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>c :bp <baR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<cr>

" Add line numbers
set nu

" Highlight search results
set hlsearch
" Incremental search
set incsearch

set backspace=indent,eol,start

"set clipboard=unnamed

" Disable arrows, get used to hjkl
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <NOp>
noremap <Right> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <Nop>
inoremap <Right> <nop>

inoremap <Esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>

" Disable annoying beeping
set noerrorbells
set vb t_vb=

" Copy Paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+p
vmap <Leader>p "+p
vmap <Leader>P "+p

set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif

autocmd BufRead,bufnewFile *.erb set filetype=eruby.html

" NERDTree settings
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '\~$', '\.o$', '\.d$']
let g:NERDTreeShowbookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapopeninTabSilent = '<RightMouse>'
let g:NERDTreeWinsize = 40
noremap <F3> :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au BufRead,BufNewfile *.hamlc set ft=haml
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_gb

"autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4

"autocmd FileType go setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

set shell=bash

set exrc
set secure

set mouse=nicra
set ttymouse=sgr

nnoremap <Leader>w :w<CR>

"" Split
noremap <Leader>h :<c-u>split<CR>
noremap <Leader>v :<c-u>vsplit<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<CR>

source ~/.vimrc.local
