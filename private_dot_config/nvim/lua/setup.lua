-- CONFIGURATIONS:
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


--- NVIM-DAP:
-- DAP configuration
local dap = require('dap')
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
-- LSP Config for Godot

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.gdscript.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "gd", "gdscript", "gdscript3" },
}
