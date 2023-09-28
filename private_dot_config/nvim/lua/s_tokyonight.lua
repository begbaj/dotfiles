require("tokyonight").setup({

    style = "night", 
    terminal_colors = true,
    transparent = true, 

    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },

    hide_inactive_statusline = false, 
    sidebars = { "qf", "help", "terminal"}, 
    dim_inactive = true, 
    hide_inactive_statusline = false,

})
