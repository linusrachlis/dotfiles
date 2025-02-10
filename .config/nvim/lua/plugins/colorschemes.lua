return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    -- priority = 1000,
    -- opts = {},
  },
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = false,
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   require("catppuccin").setup({
    --     background = {
    --       light = "latte",
    --       dark = "frappe"
    --     }
    --   })
    --   vim.cmd.colorscheme("catppuccin")
    -- end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = false,
    -- config = function()
    --   vim.cmd("colorscheme rose-pine")
    -- end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        dim_inactive_windows = true,
      })
      vim.cmd([[colorscheme everforest]])
    end
  }
}
