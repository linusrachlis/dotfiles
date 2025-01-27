return {
  "folke/snacks.nvim",
  dependencies = {
    { 'echasnovski/mini.nvim',       version = false },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "lewis6991/gitsigns.nvim",     opts = {} },
  },
  priority = 1000,
  lazy = false,
  opts = {
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>]",  function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
    { "<leader>[",  function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
    { "<leader>go", function() Snacks.gitbrowse() end,               desc = "Git Browse (Open in browser)" },
    -- Commented in favour of my own version in init.lua that creates an actual
    -- permalink (including the current SHA)
    -- TODO: contribute to Snacks?
    -- {
    --   "<leader>gy",
    --   function()
    --     Snacks.gitbrowse({
    --       open = function(url)
    --         print(url)
    --         vim.fn.setreg('+', url)
    --       end
    --     })
    --   end,
    --   desc = "Git Yank Permalink"
    -- },
    { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
  }
}
