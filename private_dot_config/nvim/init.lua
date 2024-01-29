--[[ Preamble
This configuration was written by Began Bajrami.
It is inspired by the kickstart.nvim configuration and 
based on my previous init.vim configuration
--]]
--[[
Pre-configuration
--]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--reset mappings for Space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--[[
Packet manager installation (lazy.nvim)
--]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--[[
Plugins
--]]
local plugins ={
    'nvim-tree/nvim-web-devicons',                         --- Appearence: Support for Devicons
    'folke/tokyonight.nvim',                               --- Appearence: color theme
   {"lukas-reineke/indent-blankline.nvim",                 --- Appearence: indentetion guides
      main = "ibl",
      opts = {}
    },
    'akinsho/toggleterm.nvim',                              --- Core: A neovim lua plugin to help easily manage multiple terminal windows 
    'nvim-lua/plenary.nvim',                                --- Core: Many plugins are based on this
    'folke/which-key.nvim',                                 --- Core: Show available commands
    'lewis6991/gitsigns.nvim',                              --- Core: Show signs for git changes
    'airblade/vim-rooter',                                  --- Core: document root to current project root
    'kyazdani42/nvim-tree.lua',                             --- Core: File tree explorer
    'nvim-lualine/lualine.nvim',                            --- Core: Statusline
   {'nvim-treesitter/nvim-treesitter',                      --- Core: Highlight, edit and navigate code
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',      --- Utility: textopbject manipulation
    },
    build = ':TSUpdate',
    },
    'romgrk/barbar.nvim',                                   --- Core: tab bars plugin
    'mfussenegger/nvim-dap',                                --- Core: DAP integration (Debug Adapter Protocol) [DEBUGGER]
    'rcarriga/nvim-dap-ui',                                 --- Core: DAP UI
   {'hrsh7th/nvim-cmp',                                     --- Core: Autocompletion
    dependencies = {
        'hrsh7th/cmp-buffer',                               --- Core: nvim-cmp source for buffer words
        'hrsh7th/cmp-path',                                 --- Core: nvim-cmp source for path 
        'hrsh7th/cmp-cmdline',                              --- Core: nvim-cmp source for vim's cmdline 
        'L3MON4D3/LuaSnip',                                 --- Utility: Snippet Engine & its associated nvim-cmp source
        'saadparwaiz1/cmp_luasnip',                         --- Utility: luasnip completion source for nvim-cmp 
        'hrsh7th/cmp-nvim-lsp',                             --- Utility: Adds LSP completion capabilities
        'rafamadriz/friendly-snippets',                     --- Utility: Adds a number of user-friendly snippets
    },},
    'echasnovski/mini.nvim',                                --- Fun: A set of mini plugins, for eyecandy and micro utilities
    'takac/vim-hardtime',                                   --- Fun: Make Vim harder to use

    'numToStr/Comment.nvim',                                --- Utility: Alternative to vim-commentary
    'kylechui/nvim-surround',                               --- Utility: Replaced the fantastic tpope plugin with the lua one
    'nvim-telescope/telescope.nvim',                        --- Utility: fuzzy finder
    'honza/vim-snippets',                                   --- Utility: provides some usefull snippets
    'kiyoon/tmuxsend.vim',                                  --- Utility: Vim plugin that lets you copy and paste to a different tmux pane.
    'kiyoon/nvim-tree-remote.nvim',                         --- Utility: A set of Nvim-Tree actions to open files on another remote neovim.
    'mfussenegger/nvim-dap-python',
    {                                                       --- Utility: A collection of LSP configurations
        'neovim/nvim-lspconfig',                                
        dependencies={
            { 'williamboman/mason.nvim', config = true },   --- Utility: Automatically install LSPs to stdpath for neovim
            'williamboman/mason-lspconfig.nvim',            --- Utility: gap filler between mason and lspconfig
            { 'j-hui/fidget.nvim',                          --- Utility: Standalone UI for nvim-lsp progress 
                tag = 'legacy', opts = {} 
            }, 
            'folke/neodev.nvim',                            --- Utility: Additional lua configuration, makes nvim stuff amazing!
        }
    }
}
require('lazy').setup(plugins, {})

--[[
Plugin configurations
--]]
require's_dap'
require's_cmp'
require's_gitsigns'
require's_nvimtree'
require's_tokyonight'
require's_treesitter'
require's_minivim'

require("ibl").setup { -- Indent blank line
---    show_end_of_line = true,
--- space_char_blankline = " ",
}

require("toggleterm").setup{
      size = 10,
      open_mapping = [[<A-\>]]
}

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
require("which-key").setup {}
require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed
require("nvim-surround").setup()
require('neodev').setup()                         -- Setup neovim lua configuration

--  If you want to override the default filetypes that your language server will attach to you can

--[[
Neovim settings

vim.o: behaves like :set
vim.go: behaves like :setglobal
vim.bo: for buffer-scoped options
vim.wo: for window-scoped options (can be double indexed) 
--]]

vim.cmd.colorscheme 'tokyonight'
vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.hidden = true             -- allow hiding buffers
vim.o.ignorecase = true         -- case-insensitive searching unless \c
vim.o.autoindent = true         -- auto indent
vim.o.breakindent = true        -- enable break indent
vim.o.showbreak="  .."

vim.o.expandtap = true          -- make tabs whitespaces
vim.o.tabstop=4                 -- size of a tab (in characters)
vim.o.softabstop=4              -- ?? from init.vim
vim.o.shiftwidth=4              -- visually show where the "tabwidth" should be

vim.o.splitright= true          -- window split on the right side
vim.o.laststatus=2              -- tell vim always put a status line, even if there is only one window
vim.o.cmdheight=2               -- status bar is 2 rows high
vim.o.ruler=true                -- always show cursor location in status bar

vim.o.hlsearch = false          -- set highlight on search
vim.o.clipboard = 'unnamedplus' -- sync clipboard between os and neovim.
vim.o.undofile = true           -- save undo history
vim.o.smartcase = true
vim.o.updatetime = 250          -- decrease update time
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- set completeopt to have a better completion experience
vim.o.termguicolors = true

vim.wo.number = true            -- make line numbers default
vim.wo.relativenumber=true      -- relative numbers
vim.wo.signcolumn = 'yes'       -- keep signcolumn on by default

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
--[[
Neovim Mappings
--]]

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Split navigation
vim.keymap.set('n','<C-J>','<C-W><C-J>')
vim.keymap.set('n','<C-K>','<C-W><C-K>')
vim.keymap.set('n','<C-L>','<C-W><C-L>')
vim.keymap.set('n','<C-H>','<C-W><C-H>')

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', builtin.find_files,        { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-g>', builtin.live_grep,         { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<C-b>', builtin.buffers,           { desc = '[S]earch [B]uffers'})
vim.keymap.set('n', '<leader>gf', builtin.git_files,    { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags,    { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string,  { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics,  { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume,       { desc = '[S]earch [R]esume' })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-k>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)

-- Custom mappings
local api = require "nvim-tree.api"
local function opts(desc)
  return { 
    desc = "nvim-tree: " .. desc, 
    buffer = bufnr, 
    noremap = true, 
    silent = true, 
    nowait = true 
  }
end
vim.keymap.set('n', '<A-b>', api.tree.toggle,  opts('Toggle Tree'))

--
-- Diagnostic keymaps
--

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local dap = require('dap')
local dapui = require('dapui')
local dapwid = require('dap.ui.widgets')

vim.keymap.set('n', '<leader>vl', function() dap.continue() end)
vim.keymap.set('n', '<leader>vn', function() dap.step_over() end)
vim.keymap.set('n', '<leader>vi', function() dap.step_into() end)
vim.keymap.set('n', '<leader>vO', function() dap.step_out() end)
vim.keymap.set('n', '<leader>vb', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>vB', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>vlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>vdr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>vdl', function() dap.run_last() end)

vim.keymap.set('n', '<leader>vu', function() dapui.toggle() end )

vim.keymap.set({'n', 'v'}, '<leader>vdh', function() dapwid.hover() end)
vim.keymap.set({'n', 'v'}, '<leader>vdp', function() dapwid.preview() end)
vim.keymap.set('n', '<leader>vdf', function() dapwid.centered_float(widgets.frames) end)
vim.keymap.set('n', '<leader>vds', function() dapwid.centered_float(widgets.scopes) end)

--[[
Highlight on yank 
--]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
