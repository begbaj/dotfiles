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
" snippet for sorting: :{range}sort /\".*/ r
"
Plug 'kyazdani42/nvim-web-devicons'                         " Appearence: Support for Devicons
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }          " Appearence: color theme
Plug 'lukas-reineke/indent-blankline.nvim'                  " Appearence: indentetion guides

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}               " Core: A neovim lua plugin to help easily manage multiple terminal windows 
Plug 'nvim-lua/plenary.nvim'                                " Core: Many plugins are based on this
Plug 'puremourning/vimspector'                              " Core: Powerfull debugging tool I don't know how to use
Plug 'folke/which-key.nvim'                                 " Core: Show available commands
Plug 'lewis6991/gitsigns.nvim'                              " Core: Show signs for git changes
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " Core: completion
Plug 'airblade/vim-rooter'                                  " Core: document root to current project root
Plug 'kyazdani42/nvim-tree.lua'                             " Core: file explorer
Plug 'nvim-lualine/lualine.nvim'                            " Core: statusline
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Core: syntax
Plug 'romgrk/barbar.nvim'                                   " Core: tab bars plugin

Plug 'tpope/vim-commentary'                                 " Utility: Commenting made easy
Plug 'kylechui/nvim-surround'                               " Utility: Replaced the fantastic tpope plugin with the lua one
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }    " Utility: fuzzy finder
Plug 'honza/vim-snippets'                                   " Utility: provides some usefull snippets
Plug 'nvim-treesitter/nvim-treesitter-textobjects'          " Utility: textopbject manipulation

Plug 'takac/vim-hardtime'                                   " Fun: Make Vim harder to use

call plug#end()

" SUBSECTION: Plugin configuration
"================================================================================
" Global
filetype plugin indent on

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/barbar.vim
luafile $HOME/.config/nvim/lua/setup.lua

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
set autoindent       " autoindent
set breakindent      " make wrapping text indented

set tabstop=4        " how many spaces for a tab
set softtabstop=4
set shiftwidth=4
set expandtab        " tabs are just whitespaces

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
