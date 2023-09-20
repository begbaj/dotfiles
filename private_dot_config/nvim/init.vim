" this configuration file was entirely written by Began Bajrami
" please, do not rely on what's written here, since I often make
" changes
"
" SECTION: PRE CONFIGURATION
"================================================================================
let g:plugged_home = expand('~/.config/nvim/plugged')
set autochdir

" SECTION: Plugins (using vim-plug)
"================================================================================
call plug#begin(g:plugged_home)
" snippet for sorting: :{range}sort /\".*/ r

Plug 'nvim-tree/nvim-web-devicons'                         " Appearence: Support for Devicons
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }          " Appearence: color theme
Plug 'lukas-reineke/indent-blankline.nvim'                  " Appearence: indentetion guides

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}               " Core: A neovim lua plugin to help easily manage multiple terminal windows 
Plug 'nvim-lua/plenary.nvim'                                " Core: Many plugins are based on this
" Plug 'puremourning/vimspector'                              " Core: Powerfull debugging tool I don't know how to use
Plug 'folke/which-key.nvim'                                 " Core: Show available commands
Plug 'lewis6991/gitsigns.nvim'                              " Core: Show signs for git changes
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " Core: completion
Plug 'airblade/vim-rooter'                                  " Core: document root to current project root
Plug 'kyazdani42/nvim-tree.lua'                             " Core: file explorer
Plug 'nvim-lualine/lualine.nvim'                            " Core: statusline
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Core: syntax
Plug 'romgrk/barbar.nvim'                                   " Core: tab bars plugin
Plug 'mfussenegger/nvim-dap'                                " Core: DAP integration (Debug Adapter Protocol)
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'echasnovski/mini.nvim'                                " Fun: A set of mini plugins, for eyecandy and micro utilities
Plug 'takac/vim-hardtime'                                   " Fun: Make Vim harder to use

Plug 'tpope/vim-commentary'                                 " Utility: Commenting made easy
Plug 'kylechui/nvim-surround'                               " Utility: Replaced the fantastic tpope plugin with the lua one
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }    " Utility: fuzzy finder
Plug 'honza/vim-snippets'                                   " Utility: provides some usefull snippets
Plug 'nvim-treesitter/nvim-treesitter-textobjects'          " Utility: textopbject manipulation
Plug 'kiyoon/tmuxsend.vim'                                  " Utility: Vim plugin that lets you copy and paste to a different tmux pane. 
Plug 'kiyoon/nvim-tree-remote.nvim'                         " Utility: A set of Nvim-Tree actions to open files on another remote neovim. 
Plug 'neovim/nvim-lspconfig'                                " Utility: A collection of LSP configurations

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
" I'm aware that mini.basics does already set some (or maybe all) of the
" following settings, I just don't know exactly which of these, so to stay
" consistent with what I had so far, I'm not going to remove these soon.
"================================================================================
set mouse=a          " enable mouse
set hidden           " allow hiding buffers
set updatetime=300   " As i know, it's used my timer funtions, which will call functions every 300ms
set ignorecase       " ignore case when searching
set autoindent       " autoindent
set breakindent      " make wrapping text indented

set expandtab        " tabs are just whitespaces
set tabstop=4        " how many spaces for a tab
set softtabstop=4    " not sure
set shiftwidth=4     " also not sure

set splitright       " make split dafulting to the right side
set termencoding=utf-8
set encoding=utf-8
set laststatus=2    " tell Vim always put a status line, even if there is only one window
set cmdheight=2     " status bar is 2 rows high
set ruler           " always show cursor location on status background
set relativenumber
set number
set scl=yes         " Enable sign column (for git)
set clipboard=unnamedplus
set termguicolors

" enable highlighting
syntax on enable    

" Ensures word-wrap does not split words
set formatoptions=l
set lbr
set showbreak=\ \ ..

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
autocmd FileType gdscript set expandtab!
" END OF FILE
