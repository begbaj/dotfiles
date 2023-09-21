-- CONFIGURATIONS:
vim.g.mapleader = '\\'
--  GITSIGNS
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

--- INDENT-BLANKLINE:
require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

--- LUALINE:
require("lualine").setup()

--- NVIM-TREE:
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "left",
  },
  renderer = {
    group_empty = true,
    indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
    },
  },
  filters = {
    dotfiles = true,
  },
})

--- TOKYONIGHT:
require("tokyonight").setup({
  style = "night", 
  transparent = true, 
  styles = {
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    sidebars = "dark", 
    floats = "dark", 
  },
  sidebars = { "qf", "help" }, 
  hide_inactive_statusline = false, 
  dim_inactive = false, 
})

--- NVIM-TREESITTER:
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  textobjects = {
    swap = {
	enable = true,
	swap_next = {
	["<leader>a"] = "@parameter.inner",
	},
	swap_previous = {
	    ["<leader>A"] = "@parameter.inner",
        },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
   },
  },
}

--- WHICH-KEY:
require("which-key").setup {}

--- TELESCOPE:
require('telescope').setup {}
--- require('telescope').load_extension('fzf')
--- TOGGLETERM:
require("toggleterm").setup{
      size = 10,
      open_mapping = [[<A-\>]]
}
--- SURROUND:
require("nvim-surround").setup()

--- MININVIM:
require('mini.animate').setup({
    cursor = {
        enable = true,
    },
    scroll = {
        enable = true,
    },
    open = {
        enable = false,
    },
    close = {
        enable = false,
    },
})

require('mini.starter').setup()
require('mini.move').setup()
-- require('mini.pairs').setup({})
require('mini.basics').setup({
    options = {
        basic = true,
        extra_ui = true,
    },
    mappings = {
        basic = false,
    },
})


--- PLUGIN: NVIM-DAP:
-- DAP configuration
local dap = require('dap')

vim.keymap.set('n', '<leader>vl', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>vn', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>vi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>vO', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>vb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>vB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>vlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>vdr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>vdl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>vdh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<leader>vdp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<leader>vdf', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>vds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- GDScript
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

local dapui = require("dapui").setup()
vim.keymap.set('n', '<leader>vu', function() require('dapui').toggle() end )
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- PLUGIN: LSP Config for Godot

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.gdscript.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "gd", "gdscript", "gdscript3" },
}

--- nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['gdscript'].setup {
  capabilities = capabilities
}
