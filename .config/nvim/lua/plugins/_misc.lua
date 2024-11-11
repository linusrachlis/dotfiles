return {
    "gpanders/editorconfig.nvim",
    "numToStr/prettierrc.nvim",
    {
        'echasnovski/mini.files',
        version = '*',
        config = function()
            require('mini.files').setup()
        end
    },
}
