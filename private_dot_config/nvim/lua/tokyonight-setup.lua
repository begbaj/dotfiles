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
