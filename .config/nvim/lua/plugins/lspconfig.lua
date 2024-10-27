return {
    "neovim/nvim-lspconfig",
    config = function()
        require('lspconfig').pyright.setup{}
        require('lspconfig').ts_ls.setup{}
    end
}
