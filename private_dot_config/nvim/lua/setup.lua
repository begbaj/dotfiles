-- CONFIGURATIONS:
vim.g.mapleader = '\\'

require's_dap'
require's_lsp'
require's_cmp'

require's_gitsigns'
require's_nvimtree'
require's_tokyonight'
require's_treesitter'
require's_minivim'

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
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
require("nvim-surround").setup()
