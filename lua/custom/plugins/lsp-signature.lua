return {
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        },
        hint_enable = true, -- Show parameter hints
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter",
        max_height = 12,
        max_width = 120,
        floating_window = true,
      })
    end
  }
}
