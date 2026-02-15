-- Allow editing and re-parsing qflist with :cgetbuf
vim.opt_local.errorformat = {
  "%f\\|%l\\ col\\ %c-%k\\|%m", -- with column range
  "%f\\|%l\\ col\\ %c\\|%m",    -- with only column start
  "%f\\|%l\\|%m",               -- without column
}
