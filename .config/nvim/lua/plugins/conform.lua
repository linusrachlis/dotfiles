local function pre_commit_config_exists()
  return vim.fn.filereadable(vim.fn.getcwd() .. "/.pre-commit-config.yaml") == 1
end

return {
  'stevearc/conform.nvim',
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer"
    },
  },
  opts = {
    formatters = {
      precommit_isort = {
        command = "pre-commit",
        args = { "run", "isort", "--files", "$FILENAME" },
        stdin = false,
        condition = function(_)
          return pre_commit_config_exists()
        end,
      },
      precommit_black = {
        command = "pre-commit",
        args = { "run", "black", "--files", "$FILENAME" },
        stdin = false,
        condition = function(_)
          return pre_commit_config_exists()
        end,
      },
    },
    formatters_by_ft = {
      lua = { "stylua", lsp_format = "prefer" },
      python = { "precommit_isort", "precommit_black" },
    },
  },
}
