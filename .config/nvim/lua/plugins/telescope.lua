return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup {
      pickers = {
        find_files = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        grep_string = { theme = "ivy" },
        buffers = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        resume = { theme = "ivy" },
        pickers = { theme = "ivy" },
        lsp_references = { theme = "ivy" },
        keymaps = { theme = "ivy" },
        builtin = { theme = "ivy" },
      },
    }
    telescope.load_extension('fzf')
  end,
  keys = {
    { '<leader>ff',  "<cmd>Telescope find_files<CR>",     desc = 'Telescope find files' },
    { '<leader>fg',  "<cmd>Telescope live_grep<CR>",      desc = 'Telescope live grep' },
    { '<leader>fcg', "<cmd>Telescope grep_string<CR>",    desc = 'Telescope grep string under cursor' },
    { '<leader>fb',  "<cmd>Telescope buffers<CR>",        desc = 'Telescope buffers' },
    { '<leader>fh',  "<cmd>Telescope help_tags<CR>",      desc = 'Telescope help tags' },
    { '<leader>fr',  "<cmd>Telescope resume<CR>",         desc = 'Telescope resume latest picker' },
    { "<leader>fR",  "<cmd>Telescope pickers<CR>",        desc = 'Telescope list previous pickers' },
    { "<leader>flr", "<cmd>Telescope lsp_references<CR>", desc = 'Telescope LSP references' },
    { "<leader>fk",  "<cmd>Telescope keymaps<CR>",        desc = 'Telescope keymaps' },
    { "<leader>ftb", "<cmd>Telescope builtin<CR>",        desc = 'Telescope builtin pickers' },
  },
}
