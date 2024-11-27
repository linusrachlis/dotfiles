return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                background = {
                    light = "latte",
                    dark = "frappe"
                }
            })
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
