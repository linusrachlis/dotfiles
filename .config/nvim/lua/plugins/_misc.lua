return {
    "gpanders/editorconfig.nvim",
    "numToStr/prettierrc.nvim",
    {
        'echasnovski/mini.files',
        version = '*',
        config = function()
            require('mini.files').setup({
                permanent_delete = false,
                preview = true,
            })
        end
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
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
}
