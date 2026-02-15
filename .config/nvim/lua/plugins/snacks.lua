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
        picker = { layout = 'vertical', ui_select = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        ---
        -- Pickers
        ---
        { '<leader>f',         function() Snacks.picker.files() end,                                                           desc = "Find Files" },
        { "<leader>r",         function() Snacks.picker.recent() end,                                                          desc = "Recent Files" },
        { "<leader><leader>f", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,                         desc = "Find Config File" },
        { '<leader>/',         function() Snacks.picker.grep() end,                                                            desc = "Grep" },
        { '<leader><leader>/', function() Snacks.picker.grep({ cwd = vim.fn.stdpath("config") }) end,                          desc = "Grep Config Files" },
        { "g/",                function() Snacks.picker.grep_word() end,                                                       desc = "Grep visual selection or cursor word", mode = { "n", "x" } },
        { "gO",                function() Snacks.picker.lsp_symbols() end,                                                     desc = 'LSP document symbols' },
        { "<leader>s",         function() Snacks.picker.lsp_workspace_symbols() end,                                           desc = 'LSP workspace symbols' },
        { "grr",               function() Snacks.picker.lsp_references({ jump = { tagstack = true, reuse_win = false } }) end, desc = 'LSP references' },
        { "<leader>b",         function() Snacks.picker.buffers() end,                                                         desc = 'Buffers Picker' },
        { "<leader>h",         function() Snacks.picker.help() end,                                                            desc = "Help Pages Picker" },
        { "<leader>'",         function() Snacks.picker.resume() end,                                                          desc = "Resume Picker" },
        { "<leader>?",         function() Snacks.picker.commands() end,                                                        desc = "Commands Picker" },
        { "<leader>p",         function() Snacks.picker.pickers() end,                                                         desc = "Picker Picker" },
        { "<leader><leader>d", function() Snacks.picker.diagnostics_buffer() end,                                              desc = 'Document Diagnostics' },
        { "<leader><leader>D", function() Snacks.picker.diagnostics() end,                                                     desc = 'Workspace Diagnostics' },

        ---
        -- Words
        ---
        { "<A-]>",             function() Snacks.words.jump(vim.v.count1) end,                                                 desc = "Next Reference",                       mode = { "n", "t" } },
        { "<A-[>",             function() Snacks.words.jump(-vim.v.count1) end,                                                desc = "Prev Reference",                       mode = { "n", "t" } },

        ---
        -- Git
        ---
        { "<leader>go",        function() Snacks.gitbrowse() end,                                                              desc = "Git Browse (Open in browser)" },
        -- "<leader>gy" / "Git Yank Permalink" is defined as a custom func in init.lua that creates an actual Github permalink (including the current SHA)
        { "<leader>gb",        function() Snacks.git.blame_line() end,                                                         desc = "Git Blame Line" },
        { "<leader>gf",        function() Snacks.lazygit.log_file() end,                                                       desc = "Lazygit Current File History" },
        { "<leader>gg",        function() Snacks.lazygit() end,                                                                desc = "Lazygit" },
    }
}
