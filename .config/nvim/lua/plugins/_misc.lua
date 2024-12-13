return {
    "numToStr/prettierrc.nvim",
    "numToStr/Comment.nvim",
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            enable = true,
        }
    },
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
