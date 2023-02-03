" SECTION: DOCUMENTATION
"===============================================================================
" Naming:
"   All init.vim variables and functions should start with 'my' and are global
"
"===============================================================================
" SECTION: PRE CONFIGURATION
"================================================================================
" Switch configurations between windows and unix
let g:plugged_home = expand('~/.config/nvim/plugged')
set autochdir

" SECTION: Plugins (using vim-plug)
"================================================================================
call plug#begin(g:plugged_home)

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " utility: fuzzy finder
Plug 'kyazdani42/nvim-tree.lua'                          " utility: file explorer

Plug 'honza/vim-snippets'                         " utility: provides some usefull snippets
Plug 'kyazdani42/nvim-web-devicons'               " appearence: Support for Devicons
Plug 'lukas-reineke/indent-blankline.nvim'        " appearence: indentetion guides
Plug 'nvim-lualine/lualine.nvim'                  " core: status line
Plug 'powerline/powerline'                        " appearence: Powerline 
Plug 'romgrk/barbar.nvim'                         " tab bars plugin

Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " appearence: theme

" CODE COMPLETION and UTILITIES
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'			" Commenting made easy
Plug 'tpope/vim-scriptease'
Plug 'kylechui/nvim-surround'			" Replaced the fantastic tpope plugin with the lua one
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" HIGHLIGHT
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Powerfull Highlighting plugin 

" DEBUG
Plug 'puremourning/vimspector'			" Powerfull debugging tool I don't know how to use
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}   " A neovim lua plugin to help easily manage multiple terminal windows 

" BEHAVIOUR
Plug 'airblade/vim-rooter'			" document root to current project root
Plug 'folke/which-key.nvim'			" Show available commands
Plug 'lewis6991/gitsigns.nvim'			" Show signs for git changes
Plug 'matze/vim-tex-fold'			" Foldings for TeX
Plug 'nvim-lua/plenary.nvim'			" All the lua functions I don't want to write twice
Plug 'takac/vim-hardtime'			" Make Vim harder to use



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
set hidden           " allow hiding buffers
set updatetime=300   " As i know, it's used my timer funtions, which will call functions every 300ms
set ignorecase       " ignore case when searching
" set expandtab       " ?

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
set showbreak=>>

" SECTION: My Bindings
"================================================================================
source $HOME/.config/nvim/bindings.vim

" SECTION: Plugin specific configurations
"================================================================================
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/barbar.vim
luafile $HOME/.config/nvim/lua/setup.lua

" SECTION: Appearence
"================================================================================
" colorscheme molokai
let g:tokyonight_style="night"
let g:tokyonight_transparent=1
colorscheme tokyonight
set background=dark
set termguicolors


" SECTION: setup
"================================================================================
augroup chezmoi
    autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup END

autocmd FileType markdown let b:coc_suggest_disable = 1

" END OF FILE
