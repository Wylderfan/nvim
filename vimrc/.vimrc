" Basic Settings
set nocompatible              " Use Vim settings rather than Vi settings
syntax on                     " Enable syntax highlighting
set number                    " Show line numbers
set relativenumber
set autoindent               " Auto-indent new lines
set expandtab                " Use spaces instead of tabs
set shiftwidth=4             " When indenting with '>', use 4 spaces
set tabstop=4                " Show existing tab with 4 spaces width
set smarttab                 " Better tab behavior
set showcmd                  " Show partial commands in the last line
set scrolloff=8        " Keep 8 lines above/below cursor
set sidescrolloff=8    " Keep 8 columns left/right of cursor
set clipboard=unnamed
set mouse=a
set linebreak
set backspace=indent,eol,start
set ignorecase          " Case insensitive search
set smartcase           " Case sensitive if uppercase present
set incsearch          " Show matches while typing
set hlsearch           " Highlight search results
" Autocompletion Settings
set complete+=kspell         " Add spelling completion when spell check is enabled
set completeopt=menuone,longest,preview " Configure completion options
set wildmenu                 " Enhanced command line completion
set wildmode=longest,list,full " Complete longest common string, list alternatives
set wildignore+=.pyc,.pyo,/pycache/  " Ignore compiled files
set wildignore+=.swp,.bak  " Ignore swap and backup files
" Built-in completion settings
set dictionary+=/usr/share/dict/words " Add dictionary completion
set infercase                " Adjust case of match for keyword completion
" Mappings for autocompletion
inoremap <C-Space> <C-x><C-o>      " Omni completion with CTRL-Space
inoremap <C-@> <C-Space>           " Terminal compatibility fix
inoremap <C-n> <C-x><C-n>          " Keyword completion from current buffer
inoremap <C-f> <C-x><C-f>          " File path completion
inoremap <C-l> <C-x><C-l>          " Whole line completion
inoremap <C-d> <C-x><C-d>          " Definition completion
inoremap <C-]> <C-x><C-]>          " Tag completion
" Plugin Manager (vim-plug) setup
" First install vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
" Recommended completion plugins
Plug 'ervandew/supertab'           " Better tab completion
Plug 'ycm-core/YouCompleteMe'      " Intelligent code completion
Plug 'sirver/ultisnips'            " Snippet engine
Plug 'honza/vim-snippets'          " Snippet collection
Plug 'jiangmiao/auto-pairs'         " Auto close brackets/quotes
call plug#end()
" YouCompleteMe settings
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" File type specific settings
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
nmap <silent> gd <Plug>(coc-definition)
