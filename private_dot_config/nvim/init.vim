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
" Plug 'francoiscabrol/ranger.vim'      " Ranger integration in vim and neovim
" Plug 'rbgrouleff/bclose.vim'          " The BClose Vim plugin for deleting a buffer without closing the window 
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " Markdown preview
Plug 'takac/vim-hardtime'               " Make Vim harder to use
Plug 'preservim/nerdtree'

" FUZZY FINDER
" Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy finder (fzf.vim instead)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'crispydrone/vim-tasks'

" APPEARENCE
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'romgrk/barbar.nvim'                               " tab bars plugin
Plug 'honza/vim-snippets'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'dylanaraps/wal.vim'

" CODE COMPLETION and UTILITIES
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
Plug 'airblade/vim-gitgutter'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'lervag/vimtex'

" HIGHLIGHT
Plug 'MaxMEllon/vim-jsx-pretty'                                      " to highlight jsx

" DEBUG
Plug 'vim-syntastic/syntastic'
Plug 'matze/vim-tex-fold'
Plug 'puremourning/vimspector'

" BEHAVIOUR
Plug 'airblade/vim-rooter'

" Plug 'noahfrederick/vim-composer'
" Plug 'ludovicchabant/vim-gutentags'
"
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
set breakindent     " make wrapping text indented
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

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr
set showbreak=....

" SECTION: Appearence
"================================================================================
" colorscheme molokai
colorscheme onedark
" colorscheme wal

set background=dark
set termguicolors

" SECTION: Plugin specific configurations
"================================================================================

source $HOME/.config/nvim/plug-config/coc.vim
" source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/bindings.vim
source $HOME/.config/nvim/cocrc.vim

let g:NERDTreeWinPos = "right"


" SECTION: setup
"================================================================================
augroup VimSetupNerdtree
    " start nerdtree when nvim starts
    autocmd VimEnter * NERDTree | wincmd p
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
augroup chezmoi
    autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup END

" SECTION: My Macros
"================================================================================
" Sistem dependent
"================================================================================
"
" Global
"================================================================================
let mapleader='\\'
" reload init.vim
nnoremap <F8> :so $MYVIMRC<CR>
" edit init.vim
nnoremap <F20> :!chezmoi edit $MYVIMRC<CR>

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :Rg<CR>

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
