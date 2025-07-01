return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- Usa la función 'config' para incluir toda la lógica de configuración
  config = function()
    -- Habilita colores de 24-bit
    vim.opt.termguicolors = true

    -- Inicia la configuración de bufferline
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        style_preset = require('bufferline').style_preset.default,
        numbers = 'ordinal',
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = 'slant',
        sort_by = 'insert_at_end',
        move_wraps_at_ends = true,
        show_duplicate_prefix = true,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ''
          end
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        persist_buffer_sort = true,
        right_mouse_command = 'bdelete! %d',
      },
    }

    -- Mapeos de Teclas para Bufferline
    -- Moverse entre buffers
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Ir al siguiente buffer' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Ir al buffer anterior' })

    -- Reordenar buffers
    vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Mover buffer a la derecha' })
    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Mover buffer a la izquierda' })

    -- Cerrar buffers
    vim.keymap.set('n', '<leader>bc', '<Cmd>bdelete<CR>', { desc = 'Cerrar buffer actual' })
    vim.keymap.set('n', '<leader>bC', '<Cmd>BufferLinePickClose<CR>', { desc = 'Seleccionar y cerrar buffer' })

    -- "Pin" o fijar buffers importantes
    vim.keymap.set('n', '<leader>bi', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Fijar/desfijar buffer' })

    -- Saltar a un buffer por su número ordinal
    vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Ir al buffer 1' })
    vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Ir al buffer 2' })
    vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Ir al buffer 3' })
    -- ... (y así sucesivamente para los demás números)
    vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Ir al buffer 9' })
    vim.keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Ir al último buffer' })
  end,
}
