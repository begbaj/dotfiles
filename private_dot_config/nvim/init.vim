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
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'crispydrone/vim-tasks'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'junegunn/fzf.vim'

" APPEARENCE
Plug 'honza/vim-snippets'                       " ????????????????????
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'             " Support for Devicons
Plug 'lukas-reineke/indent-blankline.nvim'      " indentetion guides
Plug 'nvim-lualine/lualine.nvim'
Plug 'powerline/powerline'                      " Powerline 
Plug 'romgrk/barbar.nvim'			" tab bars plugin

" Plug 'vim-airline/vim-airline'                  " Vim airline
" Plug 'vim-airline/vim-airline-themes'           " Vim airline themes
" Plug 'mhinz/vim-startify'                     " Start page
" Plug 'preservim/nerdtree'                     " NERDTree
" Plug 'ryanoasis/vim-devicons'                   " Support for Devicons

"" COLOR SCHEMES
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tomasr/molokai'

" CODE COMPLETION and UTILITIES
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'			" Commenting made easy
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'vim-autoformat/vim-autoformat'

" Plug 'airblade/vim-gitgutter'			" Show git diff markers
" Plug 'tpope/vim-projectionist'

" HIGHLIGHT
Plug 'nvim-treesitter/nvim-treesitter'		" Powerfull Highlighting plugin 

" DEBUG
Plug 'puremourning/vimspector'			" Powerfull debugging tool I don't know how to use
Plug 'vim-syntastic/syntastic'			" ????????????????

" BEHAVIOUR
Plug 'airblade/vim-rooter'			" document root to current project root
Plug 'folke/which-key.nvim'			" Show available commands
Plug 'lewis6991/gitsigns.nvim'			" Show signs for git changes
Plug 'matze/vim-tex-fold'			" Foldings for TeX
Plug 'nvim-lua/plenary.nvim'			" All the lua functions I don't want to write twice
Plug 'takac/vim-hardtime'			" Make Vim harder to use
Plug 'tpope/vim-fugitive'

" Plug 'ludovicchabant/vim-gutentags'		" Automatically generate ctags

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


" SECTION: Plugin specific configurations
"================================================================================

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/barbar.vim
" source $HOME/.config/nvim/plug-config/NERDTree.vim
" source $HOME/.config/nvim/plug-config/vimtex.vim
luafile $HOME/.config/nvim/lua/setup.lua

" SECTION: Appearence
"================================================================================
" colorscheme molokai
" let g:tokyonight_style="night"
" let g:tokyonight_transparent=1
" luafile $HOME/.config/nvim/lua/tokyonight-setup.lua
colorscheme tokyonight

" colorscheme wal
set background=dark
set termguicolors


" SECTION: setup
"================================================================================
augroup chezmoi
    autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup END

autocmd FileType markdown let b:coc_suggest_disable = 1

" SECTION: Functions
"================================================================================
" Terminal Function (reddit: https://www.reddit.com/r/vim/comments/8n5bzs/using_neovim_is_there_a_way_to_display_a_terminal/)
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
	    set bufhidden
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" SECTION: My Macros
"================================================================================
" Sistem dependent
"================================================================================
"
" Global
"================================================================================
source $HOME/.config/nvim/bindings.vim

" END OF FILE
