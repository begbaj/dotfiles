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
