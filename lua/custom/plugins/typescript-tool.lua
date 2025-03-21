-- In lua/custom/plugins/typescript-tool.lua
return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  opts = {
    settings = {
      -- Specify preferences for auto imports
      tsserver_file_preferences = {
        importModuleSpecifierPreference = "relative",
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsWithSnippetText = true,
      },
      -- Organize imports command for typescript-tools
      tsserver_format_options = {
        allowIncompleteCompletions = true,
        allowRenameOfImportPath = true,
      },
    },
    -- Enhance your experience with additional keymaps
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
        if result.diagnostics == nil then
          return
        end
        -- Filter out some unwanted diagnostics
        result.diagnostics = vim.tbl_filter(function(diagnostic)
          return diagnostic.code ~= 80001 -- Removes 'File is a CommonJS module'
        end, result.diagnostics)
        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end,
    },
  },
  config = function(_, opts)
    require("typescript-tools").setup(opts)
    -- Add specific keymaps for typescript-tools
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      callback = function()
        vim.keymap.set("n", "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>", { desc = "Add Missing Imports" })
        vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", { desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cs", "<cmd>TSToolsSortImports<CR>", { desc = "Sort Imports" })
        vim.keymap.set("n", "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>", { desc = "Remove Unused Imports" })
        vim.keymap.set("n", "<leader>cf", "<cmd>TSToolsFixAll<CR>", { desc = "Fix Issues" })
      end,
    })
  end,
}
