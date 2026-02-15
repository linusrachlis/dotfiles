return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.files").setup({
        options = {
          permanent_delete = false,
          windows = {
            width_focus = 50,
            width_nofocus = 30,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>e",
        function()
          -- Open current working directory in a last used state
          require("mini.files").open()
        end,
        desc = "Mini Files - CWD"
      },
      {
        "<leader>E",
        function()
          -- Open directory of current file (in last used state) focused on the file
          require("mini.files").open(vim.api.nvim_buf_get_name(0))
        end,
        desc = "Mini Files - current file"
      },
    },
  },
}
