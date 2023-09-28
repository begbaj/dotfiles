require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
          enable = true,
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
