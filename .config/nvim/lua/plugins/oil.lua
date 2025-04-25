return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-g>"] = "actions.refresh",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
    },
  },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
