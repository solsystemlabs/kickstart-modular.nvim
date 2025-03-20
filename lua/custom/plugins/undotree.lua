return { {
  'mbbill/undotree',
  config = function()
    -- Enable persistent undo history
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

    -- Undotree configuration
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_DiffAutoOpen = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffCommand = "diff"

    -- Add keymapping for toggling Undotree
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndotree' })
  end,
} }
