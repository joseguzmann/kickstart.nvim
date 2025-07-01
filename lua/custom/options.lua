-- Opciones para el número de línea
vim.opt.number = true
vim.opt.relativenumber = true

-- Autocmd para mostrar números de línea relativos solo en modo Normal
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.opt.relativenumber = true
  end,
})
