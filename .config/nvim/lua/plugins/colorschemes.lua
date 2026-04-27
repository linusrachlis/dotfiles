return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        background = {
          style = "storm",
          light_style = "day",
          dim_inactive = true,
        }
      })
      vim.cmd.colorscheme("tokyonight")
    end
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     require("catppuccin").setup({
  --       background = {
  --         light = "latte",
  --         dark = "macchiato",
  --       },
  --       show_end_of_buffer = true,
  --       auto_integrations = true,
  --     })
  --
  --     vim.cmd.colorscheme("catppuccin")
  --   end
  -- }
}
