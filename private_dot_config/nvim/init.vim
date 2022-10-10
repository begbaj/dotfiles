" SECTION: DOCUMENTATION
"===============================================================================
" Naming:
"   All init.vim variables and functions should start with 'my' and are generally global
"
"===============================================================================
" SECTION: PRE CONFIGURATION
" Environmental configuration, based on the os
"================================================================================
" Switch configurations between windows and unix
if has("win32") || has("win64")
    let g:plugged_home = expand('~/AppData/Local/nvim/plugged')
    set langmenu=en_US  " set language to english, ignoring system's language
    let $LANG = 'en_US'
    source $VIMRUNTIME/delmenu.vim 
    source $VIMRUNTIME/menu.vim
    source $VIMRUNTIME/menu.vim
    let g:my_os_win = 1     " needed for other os dependent configurations
    set autochdir
elseif has("unix")
    let g:plugged_home = expand('~/.config/nvim/plugged')
    set autochdir
endif

" SECTION: Plugins (using vim-plug)
"================================================================================
call plug#begin(g:plugged_home)
" FUZZY FINDER
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'crispydrone/vim-tasks'

" APPEARENCE
Plug 'romgrk/barbar.nvim'			" tab bars plugin
Plug 'lukas-reineke/indent-blankline.nvim'      " indentetion guides
" Plug 'mhinz/vim-startify'                     " Start page

" Plug 'preservim/nerdtree'                     " NERDTree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'powerline/powerline'                      " Powerline 
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline'                  " Vim airline
" Plug 'vim-airline/vim-airline-themes'           " Vim airline themes
Plug 'honza/vim-snippets'                       " ????????????????????
Plug 'kyazdani42/nvim-web-devicons'             " Support for Devicons
Plug 'ryanoasis/vim-devicons'                   " Support ofr Devicons

"" COLOR SCHEMES
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" CODE COMPLETION and UTILITIES
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
" Plug 'airblade/vim-gitgutter'                   " Show git diff markers
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-commentary'                     " Commenting made easy
" Plug 'tpope/vim-projectionist'
Plug 'lervag/vimtex'

" HIGHLIGHT
Plug 'nvim-treesitter/nvim-treesitter'          " Powerfull Highlighting plugin 

" DEBUG
Plug 'vim-syntastic/syntastic'                  " ????????????????
Plug 'puremourning/vimspector'                  " Powerfull debugging tool I don't know how to use

" BEHAVIOUR
Plug 'matze/vim-tex-fold'                       " Foldings for TeX
Plug 'airblade/vim-rooter'                      " document root to current project root
" Plug 'ludovicchabant/vim-gutentags'             " Automatically generate ctags
Plug 'folke/which-key.nvim'                     " Show available commands
Plug 'takac/vim-hardtime'			" Make Vim harder to use
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

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
let g:hardtime_timeout = 500
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_allow_different_key = 1

" gutentags
augroup NOTAGAS
    autocmd FileType .gitignore let g:gutentags_enabled = 0
augroup END

" Treesitter folding
set foldmethod=expr
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()

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
set number
set scl=yes         " Enable sign column
set clipboard=unnamedplus
set termguicolors
" enable highlighting
syntax on enable    

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr
set showbreak=....

" SECTION: Appearence
"================================================================================
" colorscheme molokai
" let g:tokyonight_style="night"
" let g:tokyonight_transparent=1
luafile $HOME/.config/nvim/lua/tokyonight-setup.lua
colorscheme tokyonight

" colorscheme wal
set background=dark
set termguicolors

" SECTION: Plugin specific configurations
"================================================================================

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/barbar.vim
" source $HOME/.config/nvim/plug-config/NERDTree.vim
" source $HOME/.config/nvim/plug-config/vimtex.vim
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/whichkey.lua
luafile $HOME/.config/nvim/lua/gitsignsconf.lua
luafile $HOME/.config/nvim/lua/nvim_tree.lua
luafile $HOME/.config/nvim/lua/indent-blankline.lua

lua << END
require('lualine').setup()
END



" SECTION: setup
"================================================================================
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
source $HOME/.config/nvim/bindings.vim
" END OF FILE
