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

require('Comment').setup()

require("which-key").setup {}
require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed
require("nvim-surround").setup()
require('neodev').setup()                         -- Setup neovim lua configuration
