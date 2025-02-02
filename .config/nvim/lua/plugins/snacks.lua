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
    picker = { layout = 'vertical' },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    ---
    -- Pickers
    ---
    { '<leader>ff',  function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fc",  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { '<leader>fg',  function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { '<leader>fcg', function() Snacks.picker.grep_word() end,                               desc = "Grep visual selection or word", mode = { "n", "x" } },
    { "<leader>fld", function() Snacks.picker.lsp_symbols() end,                             desc = 'LSP document symbols' },
    { "<leader>flw", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = 'LSP workspace symbols' },
    { "<leader>flr", function() Snacks.picker.lsp_references() end,                          desc = 'LSP references' },
    { '<leader>fb',  function() Snacks.picker.buffers() end,                                 desc = 'Buffers Picker' },
    { '<leader>fh',  function() Snacks.picker.help() end,                                    desc = "Help Pages Picker" },
    { '<leader>fr',  function() Snacks.picker.resume() end,                                  desc = "Resume Picker" },
    { "<leader>fp",  function() Snacks.picker.commands() end,                                desc = "Commands Picker" },
    { "<leader>fP",  function() Snacks.picker.pickers() end,                                 desc = "Picker Picker" },
    { "<leader>fdd", function() Snacks.picker.diagnostics_buffer() end,                      desc = 'Document Diagnostics' },
    { "<leader>fdw", function() Snacks.picker.diagnostics() end,                             desc = 'Workspace Diagnostics' },

    ---
    -- Words
    ---
    { "<leader>]",   function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",                mode = { "n", "t" } },
    { "<leader>[",   function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",                mode = { "n", "t" } },

    ---
    -- Git
    ---
    { "<leader>go",  function() Snacks.gitbrowse() end,                                      desc = "Git Browse (Open in browser)" },
    -- "<leader>gy" / "Git Yank Permalink" is defined as a custom func in init.lua that creates an actual permalink (including the current SHA)
    { "<leader>gb",  function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gf",  function() Snacks.lazygit.log_file() end,                               desc = "Lazygit Current File History" },
    { "<leader>gg",  function() Snacks.lazygit() end,                                        desc = "Lazygit" },
  }
}
