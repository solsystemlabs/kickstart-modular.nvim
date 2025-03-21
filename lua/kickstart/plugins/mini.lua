return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      mini_surround.setup({
        -- Add custom surroundings
        -- mappings = {
        --   add = 'sa', -- Add surrounding in Normal and Visual modes
        --   delete = 'sd', -- Delete surrounding
        --   find = 'sf', -- Find surrounding (to the right)
        --   find_left = 'sF', -- Find surrounding (to the left)
        --   highlight = 'sh', -- Highlight surrounding
        --   replace = 'sr', -- Replace surrounding
        --   update_n_lines = 'sn', -- Update `n_lines`
        -- },

        -- Customize surroundings
        surrounds = {
          -- Use 't' for HTML tags
          t = {
            input = { '<(%w+)>', '</(%w+)>' },
            output = function(content, capture)
              return { '<' .. capture[1] .. '>', '</' .. capture[1] .. '>' }
            end,
          },
          -- Use 'T' for interactive HTML tag input
          T = {
            input = function()
              local tag = vim.fn.input('Enter tag name: ')
              if tag == '' then return nil end
              return { '<' .. tag .. '>', '</' .. tag .. '>' }
            end,
          },
        },
      })

      vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
