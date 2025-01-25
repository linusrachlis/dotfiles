return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    -- opts = {},
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
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    -- config = function()
    --   vim.cmd("colorscheme rose-pine")
    -- end
  }
}
