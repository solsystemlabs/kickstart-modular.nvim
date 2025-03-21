return {
  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('tokyonight').setup {
  --       styles = {
  --         comments = { italic = false }, -- Disable italics in comments
  --       },
  --     }
  --
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-storm'
  --   end,
  -- },

  -- {
  --   "tiagovla/tokyodark.nvim",
  --   priority = 1000,
  --   opts = {
  --     -- custom options here
  --     styles = {
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --       identifiers = { italic = false },
  --       functions = { italic = false },
  --       variables = { italic = false },
  --     }
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts) -- calling setup is optional
  --     vim.cmd [[colorscheme tokyodark]]
  --   end,
  -- }

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'darker'
      })
      require('onedark').load()
      vim.cmd.colorscheme 'onedark'
    end
  }
}
-- vim: ts=2 sts=2 sw=2 et
