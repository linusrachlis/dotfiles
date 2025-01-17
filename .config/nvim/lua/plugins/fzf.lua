return {
  "ibhagwan/fzf-lua",
  lazy = false,
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    winopts = {
      preview = {
        layout = 'vertical'
      }
    }
  },
  keys = {
    -- FzfLua commands picker works better than Telescope command finder, I think that doesn't include command mode commands
    { "<leader>fp",  "<cmd>FzfLua commands<CR>",                   desc = 'Fzf command pallette' },
    { "<leader>fzb", "<cmd>FzfLua builtin<CR>",                    desc = 'Fzf builtin pickers' },
    { "<leader>fdd", "<cmd>FzfLua lsp_document_diagnostics<CR>",   desc = 'Fzf LSP document diagnostics' },
    { "<leader>fdw", "<cmd>FzfLua lsp_workspace_diagnostics<CR>",  desc = 'Fzf LSP workspace diagnostics' },
  },
}
