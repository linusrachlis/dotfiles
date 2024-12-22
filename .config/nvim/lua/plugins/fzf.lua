return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  keys = {
    -- FzfLua commands picker works better than Telescope command finder, I think that doesn't include command mode commands
    { "<leader>fp",  "<cmd>FzfLua commands<CR>",                   desc = 'Fzf command pallette' },
    { "<leader>fld", "<cmd>FzfLua lsp_document_symbols<CR>",       desc = 'Fzf LSP document symbols' },
    { "<leader>flw", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = 'Fzf LSP workspace symbols' },
    { "<leader>fdd", "<cmd>FzfLua lsp_document_diagnostics<CR>",   desc = 'Fzf LSP document diagnostics' },
    { "<leader>fdw", "<cmd>FzfLua lsp_workspace_diagnostics<CR>",  desc = 'Fzf LSP workspace diagnostics' },
    { "<leader>fzb", "<cmd>FzfLua builtin<CR>",  desc = 'Fzf builtin pickers' },
  },
}
