--[[ THIS IS NO LONGER NEEDED, unless you're reverting to init.vim ]]
require'lua.s_dap'
require'lua.s_lsp'
require'lua.s_cmp'

require'lua.s_gitsigns'
require'lua.s_nvimtree'
require'lua.s_tokyonight'
require'lua.s_treesitter'
require'lua.s_minivim'

require("ibl").setup { -- Indent blank line
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
