return {
  'echasnovski/mini.files',
  enabled = false,
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
  keys = {
    {
      "<leader>fm",
      function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end,
      desc = 'Mini.files - directory of current file'
    },
    {
      "<leader>fM",
      function() require('mini.files').open() end,
      desc = 'Mini.files - CWD'
    }
  },
}
