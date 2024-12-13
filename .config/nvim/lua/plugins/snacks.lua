return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        git = { enabled = true},
        gitbrowse = { enabled = true},
        lazygit = { enabled = true},
    },
    keys = {
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
}
