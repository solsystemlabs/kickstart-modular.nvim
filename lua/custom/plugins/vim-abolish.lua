return {
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
        iabbrev teh the
        iabbrev con{os, sl} con{sol}e
        iabbrev con{oso}le con{sol}e

        if exists(':Abolish')
          source ~/.config/nvim/after/plugin/abolish.vim
        endif
      ]])
    end,
  }
}
