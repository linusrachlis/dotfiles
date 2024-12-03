return {
    "gpanders/editorconfig.nvim",
    "numToStr/prettierrc.nvim",
    "numToStr/Comment.nvim",
    {
        'echasnovski/mini.files',
        version = '*',
        opts = {
            options = {
                permanent_delete = false
            },
            windows = {
                preview = true,
                width_preview = 60
            }
        },
    },
    {
        'echasnovski/mini.trailspace',
        version = '*',
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        }
    },
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },
}
