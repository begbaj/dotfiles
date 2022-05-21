" SECTION: DOCUMENTATION
"===============================================================================
" Naming:
"   All init.vim variables and functions should start with 'my' and are generally global
"
"===============================================================================

" SECTION: PRE CONFIGURATION
" Environmental configuration, based on the os
"================================================================================
if has("win32") || has("win64")
"================================================================================
" Windows preconfigration
    let g:plugged_home = expand('~/AppData/Local/nvim/plugged')

    set langmenu=en_US  " set language to english, ignoring system's language
    let $LANG = 'en_US'
    source $VIMRUNTIME/delmenu.vim 
    source $VIMRUNTIME/menu.vim

    let g:my_os_win = 1     " needed for other os dependent configurations
"================================================================================
elseif has("unix")
"================================================================================
" Linux preconfiguration
    let g:plugged_home = expand('~/.config/nvim/plugged')
"================================================================================
else
    let g:plugged_home = '~/.config/nvim/plugged'
    let g:os_win = 0
endif

set autochdir

" SECTION: Plugins (using vim-plug)
"================================================================================
call plug#begin(g:plugged_home)
" ALL OSs
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-scriptease'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'powerline/powerline'
Plug 'tomasiser/vim-code-dark'
Plug 'airblade/vim-gitgutter'
Plug 'vim-autoformat/vim-autoformat'
Plug 'matze/vim-tex-fold'
Plug 'crispydrone/vim-tasks'
Plug 'tomasr/molokai'
Plug 'honza/vim-snippets'
Plug 'romgrk/barbar.nvim'                               " tab bars plugin
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'puremourning/vimspector'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/projectionist.vim'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
" Plug 'lervag/vimtex'
" Plug 'ludovicchabant/vim-gutentags'
" Windows only
if exists("my_os_win")
    Plug 'begbaj/vim-icue', {'branch': 'development'}
endif
call plug#end()


" SUBSECTION: Plugin configuration
"================================================================================
" Global
filetype plugin indent on

" Airline
let g:airline_powerline_fonts = 1

" Hardtime
let g:hardtime_default_on = 0

" SECTION: Environment options
"================================================================================
set mouse=a          " disable mouse
set hidden          " allow hiding buffers
set updatetime=300  " As i know, it's used my timer funtions, which will call functions every 300ms
set ignorecase      " ignore case when searching
set expandtab       " ?
set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set splitright
set termencoding=utf-8
set encoding=utf-8
set laststatus=2    " tell Vim always put a status line, even if there is only one window
set cmdheight=2     " status bar is 2 rows high
set ruler           " always show cursor location on status background
set relativenumber
set clipboard=unnamedplus
set termguicolors
syntax on enable    " enable highlighting

" SECTION: Appearence
"================================================================================
colorscheme molokai
set background=dark
set termguicolors

" SECTION: Plugin specific configurations
"================================================================================

source $HOME/.config/nvim/plug-config/coc.vim
" source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/barbar.vim

" SECTION: setup
"================================================================================
augroup VimSetupNerdtree
    " start nerdtree when nvim starts
    autocmd VimEnter * NERDTree | wincmd p
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" SECTION: My Macros
"================================================================================
" Sistem dependent
"================================================================================
" Global
"================================================================================
let mapleader='\\'
" reload init.vim
nnoremap <F8> :so $MYVIMRC<CR>
" edit init.vim
nnoremap <F20> :!chezmoi edit $MYVIMRC<CR>

" indent multiple lines in visual mode
vnoremap <tab> >
" untab multiple lines in visual mode
vnoremap <S-tab> <

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Right> zL
nnoremap <Left> zH
nnoremap <Up> <C-u>
nnoremap <Down> <C-d>
" END OF FILE
