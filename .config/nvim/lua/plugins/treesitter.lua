return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = False,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "python",
        "json",
        "yaml",
        "markdown",
        "markdown_inline"
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
  },
}
