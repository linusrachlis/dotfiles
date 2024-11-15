-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--

-- [[ Load Plugin Manager ]]
require("config.lazy")
--
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = 4      -- Number of spaces for each step of indent
vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.softtabstop = 4     -- Number of spaces a tab counts for while editing
vim.opt.smartindent = true  -- Insert indents automatically
vim.opt.shiftround = true   -- Round indent to multiple of 'shiftwidth'
vim.opt.autoindent = true   -- Copy indent from current line when starting a new line
vim.opt.textwidth = 0


-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Colorscheme
vim.cmd.colorscheme "catppuccin"


-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Quick reload config
vim.keymap.set('n', '<leader>rc', '<cmd>luafile $MYVIMRC<CR>')

-- Make j and k act as expected when lines are soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Copy GH link
vim.api.nvim_create_user_command('GithubCopyLink', function ()
  local commit_sha = vim.fn.system('echo -n $(git rev-parse HEAD)')
  local full_path = vim.api.nvim_buf_get_name(0)
  local relative_path = vim.fn.fnamemodify(full_path, ':.')
  local gh_main_url = vim.fn.system('echo -n $(gh repo view --json url -q .url)')

  local line_expr_for_url
  -- The visual line mode doesn't quite work because the marks get the most
  -- recent visual selection but not the current
  --
  -- local is_visual_line_mode = vim.fn.mode() == 'V'
  -- if is_visual_line_mode then
    -- local start_pos = vim.fn.getpos("'<")
    -- local end_pos = vim.fn.getpos("'>")
    -- local start_line = start_pos[2]
    -- local end_line = end_pos[2]
    -- line_expr_for_url = "L" .. start_line .. "-L" .. end_line
  -- else
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    line_expr_for_url = "L" .. line_number
  -- end

  local full_gh_permalink = gh_main_url .. "/blob/" .. commit_sha .. "/" .. relative_path .. "#" .. line_expr_for_url
  print(full_gh_permalink)
  vim.fn.setreg('+', full_gh_permalink)
end, {})
vim.keymap.set({'n', 'v'}, '<leader>gh', '<cmd>GithubCopyLink<CR>')
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>fm", MiniFiles.open)
vim.api.nvim_create_user_command('CopyRelPath', function ()
  local full_path = vim.api.nvim_buf_get_name(0)
  local relative_path = vim.fn.fnamemodify(full_path, ':.')
  print(relative_path)
  vim.fn.setreg('+', relative_path)
end, {})

local telescope_builtins = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtins.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>flg', telescope_builtins.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fg', telescope_builtins.grep_string, { desc = 'Telescope grep string under cursor' })
vim.keymap.set('n', '<leader>fb', telescope_builtins.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtins.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>flr", telescope_builtins.lsp_references, { desc = 'Telescope LSP references' })

-- Use FzfLua for commands picker instead of Telescope because it includes ex commands
vim.keymap.set("n", "<leader>fp", '<cmd>FzfLua commands<CR>', { desc = 'Fzf command pallette' })
