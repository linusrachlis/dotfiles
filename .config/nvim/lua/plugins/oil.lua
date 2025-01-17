return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  lazy = false,
  opts = {},
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
