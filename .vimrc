call plug#begin()

Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

syntax enable                               " Enable syntax for all files
colorscheme onedark                         " Enable a default desert colorscheme

set encoding=utf-8                          " Sets the encoding to use inside Vim
set nocompatible                            " Disable compatibility with Vi
set nobackup                                " Disable backup of files when opening it
set backspace=indent,eol,start              " Make backspaces behaves like every other editor
set number                                  " Enable numbers
set relativenumber                          " Make numbers relative, very good to jump between lines
set shiftwidth=2                            " Set the shift width to value 2
set tabstop=2                               " Set tabs to support 2 spaces
set softtabstop=2                           " Set soft tabs to support 2.
set smartindent                             " Recognizes the indenting when creating new lines
set breakindent                             "
set expandtab                               " Allow to use appropriate number of spaces in insert mode.
set linespace=25                            " For those editors that support line height
set hlsearch                                " Highlight what we type for search
set incsearch                               " Allow increment highlight happens
set termguicolors                           " Set more color if terminal supports it
set confirm                                 " Ask for confirmation instead of an error
set signcolumn=auto                         " Only draw signcolumn if necessary

let mapleader = ' '                         " Map the leader key to space
let maplocalleader = ' '                    " Map the local leader key to space

setlocal spell spelllang=en_us              " Spell for american english

" Mappings
nmap <Leader>q :tabc<cr>                    " Close current tab with leader+q
nmap <Leader>k :nohlsearch<cr>              " Clean all search with a simple command
nmap <Leader>ev :tabedit $MYVIMRC<cr>       " Make it easy to save .vimrc file.
nmap <C-w> <cmd>bdelete<cr>                 " Close current buffer with Ctrl+w
nmap <Leader>w :tabc<cr>                    " Close current tab with Leader+w

nmap <C-Up> :resize +2<cr>                  " Resize with arrows
nmap <C-Down> :resize -2<cr>
nmap <C-Left> :vertical resize -2<cr>
nmap <C-Right> :vertical resize +2<cr>

vmap < <gv                                  " Maintain selection after moving indentation to the right
vmap > >gv                                  " Maintain selection after moving indentation to the left

imap ;; <esc>A;<esc>                        " Insert ; at the end of line if possible
imap ,, <esc>A,<esc>                        " Insert comma at the end of line if possible

inoremap jj <esc>                           " Enter normal mode when navigating through lines

" Auto Mappings
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %      " Automatically source .vimrc file on save.
augroup END

" FZF
nmap <C-p> :Files<cr>
nmap <C-h> :History<cr>
nmap <C-b> :Buffers<cr>
nmap <C-g> :Ag<cr>

" Floaterm
let g:floaterm_wintype='split'
nmap <C-a> <esc>:FloatermToggle<cr>
tmap <C-a> <esc>:FloatermToggle<cr>
