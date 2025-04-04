return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {},
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
}
