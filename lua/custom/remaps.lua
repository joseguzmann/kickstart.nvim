------------------------------------------------------------------
-- Atajos de Navegación ---------------------------------------------------------------
-- Centrar la vista al mover media página
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Bajar media página y centrar' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Subir media página y centrar' })

-- Centrar la vista al buscar la siguiente/anterior ocurrencia
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Siguiente búsqueda y centrar' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Búsqueda anterior y centrar' })

------------------------------------------------------------------
-- Atajos de Edición y Formato
------------------------------------------------------------------
-- Indentar/des-indentar en modo Visual sin perder la selección
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indentar y mantener selección' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Des-indentar y mantener selección' })

-- Mover líneas de código seleccionadas en modo Visual
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Mover línea arriba' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Mover línea abajo' })

-- Sustituir la palabra bajo el cursor en todo el archivo
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Sustituir palabra en archivo' })

------------------------------------------------------------------
-- Atajos de Portapapeles (Clipboard) y Registros
------------------------------------------------------------------
-- Borrar sin afectar el portapapeles (usa el "black hole register")
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Borrar sin guardar en registro' })

-- Pegar en modo visual sin perder lo que tenías copiado
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Pegar sin sobrescribir registro' })

------------------------------------------------------------------
-- Atajos de Utilidad
------------------------------------------------------------------
-- Formatea el buffer actual con conform.nvim
vim.keymap.set('n', '<leader>f', function()
  require('conform').format { bufnr = 0 }
end)
