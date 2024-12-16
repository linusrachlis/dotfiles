return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        git = { enabled = true},
        gitbrowse = { enabled = true},
        lazygit = { enabled = true},
    },
    keys = {
        { "<leader>]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "<leader>[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse (Open in browser)" },
        { "<leader>gy", function()
            Snacks.gitbrowse({
                open = function(url)
                    print(url)
                    vim.fn.setreg('+', url)
                end
            })
        end, desc = "Git Yank Permalink" },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
}
