-- Allow editing and re-parsing qflist with :cgetbuf
vim.opt_local.errorformat = {
  "%f\\|%l\\ col\\ %c-%k\\|%m", -- with column range
  "%f\\|%l\\ col\\ %c\\|%m",    -- with only column start
  "%f\\|%l\\|%m",               -- without column
}

vim.api.nvim_create_autocmd("BufEnter", {
  buffer = 0,
  callback = function()
    print("buf enter")
    vim.opt_local.modifiable = true
  end,
})

vim.api.nvim_create_autocmd("BufWriteCmd", {
  buffer = 0,
  callback = function()
    print("buf write")
    vim.cmd("cgetbuf")
  end,
})
