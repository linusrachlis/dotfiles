-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

vim.opt.breakindent = true -- Enable break indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Number of spaces for each step of indent
vim.opt.tabstop = 4        -- Number of spaces a tab counts for
vim.opt.softtabstop = 4    -- Number of spaces a tab counts for while editing
-- TODO: disable for md files
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.shiftround = true  -- Round indent to multiple of 'shiftwidth'
vim.opt.autoindent = true  -- Copy indent from current line when starting a new lineadofjasdf
vim.opt.textwidth = 0      -- Default text width

-- Folding: fold on treesitter by default
vim.opt.foldlevel = 999
vim.opt.foldcolumn = "auto:9"
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

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

vim.opt.hlsearch = true

vim.opt.completeopt = "menu,popup,fuzzy"

-- [[ Setting plugin options ]]
-- Use node v20 for Copilot (system default is still 18)
vim.g.copilot_node_command = "/Users/linusrachlis/.nvm/versions/node/v20.18.3/bin/node"
-- Disable copilot inline completions (I only want it when explicitly invoked)
vim.cmd([[
  let g:copilot_filetypes = { '*': v:false }
]])

-- [[ Load Plugin Manager ]]
require("config.lazy")

-- [[ Basic Keymaps and User Commands ]]
--  See `:help vim.keymap.set()`

-- Reload config
vim.api.nvim_create_user_command("ReloadConfig", "luafile $MYVIMRC", { desc = "Reload Neovim config" })

-- Clear search highlights on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohls<cr>')

-- Diagnostic-related
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic error messages' })

-- vim.diagnostic.config({
--   virtual_text = { current_line = true }
-- })
-- also can play with virtual_lines = true

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Make j and k act as expected when lines are soft-wrapped
vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')

-- Easy light/dark toggling
vim.keymap.set('n', '<leader><leader>bl', '<CMD>set bg=light<CR>', { desc = 'Set light background' })
vim.keymap.set('n', '<leader><leader>bd', '<CMD>set bg=dark<CR>', { desc = 'Set dark background' })

-- LSP shortcuts
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = 'LSP format' })

local function get_relative_file_path()
  local full_path = vim.api.nvim_buf_get_name(0)
  return vim.fn.fnamemodify(full_path, ':.')
end

-- Copy file path relative to CWD
vim.api.nvim_create_user_command('CopyRelPath', function()
  local relative_path = get_relative_file_path()
  print(relative_path)
  vim.fn.setreg('+', relative_path)
end, {})
vim.keymap.set('n', "<leader>yp", '<cmd>CopyRelPath<CR>', { desc = 'Copy file path relative to CWD' })

-- Copy file path relative to CWD with line number in a qflist-compatible format
vim.api.nvim_create_user_command('CopyRelPathWithLineNumber', function()
  local relative_path = get_relative_file_path()
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local full_result = relative_path .. ":" .. line_number
  print(full_result)
  vim.fn.setreg('+', full_result)
end, {})
vim.keymap.set('n', "<leader>yP", '<cmd>CopyRelPathWithLineNumber<CR>',
  { desc = 'Copy file path with line number relative to CWD' })

-- :cd or :lcd to directory of current file
vim.api.nvim_create_user_command("CdCurrentFile", "cd %:p:h", {})
vim.api.nvim_create_user_command("LcdCurrentFile", "lcd %:p:h", {})

-- Copy GH link
vim.api.nvim_create_user_command('CopyGithubPermalink', function()
  local commit_sha = vim.fn.system('echo -n $(git rev-parse HEAD)')
  local relative_path = get_relative_file_path()
  local gh_main_url = vim.fn.system('echo -n $(gh repo view --json url -q .url)')

  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local line_expr_for_url = "L" .. line_number

  local full_gh_permalink = gh_main_url .. "/blob/" .. commit_sha .. "/" .. relative_path .. "#" .. line_expr_for_url
  print(full_gh_permalink)
  vim.fn.setreg('+', full_gh_permalink)
end, {})
vim.keymap.set({ 'n', 'v' }, '<leader>gy', '<cmd>CopyGithubPermalink<CR>', { desc = 'Git Yank Permalink' })

-- Easier window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

-- Easier window resizing
vim.keymap.set('n', '<C-=>', '<cmd>resize +5<CR>')
vim.keymap.set('n', '<C-->', '<cmd>resize -5<CR>')
vim.keymap.set('n', '<C-.>', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<C-,>', '<cmd>vertical resize -5<CR>')
