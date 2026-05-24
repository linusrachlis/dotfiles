return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('pyright')
    vim.lsp.enable('terraformls')
    vim.lsp.enable('phpactor')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('html')
    vim.lsp.enable('lua_ls')
  end,
}
