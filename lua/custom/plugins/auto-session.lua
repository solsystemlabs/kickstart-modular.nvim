return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = true,
        -- Save session when leaving Neovim
        auto_session_on_exit = true,
        pre_save_cmds = { "Neotree close" },
        post_restore_cmds = { "Neotree reveal" }
      }

      -- Add keymaps for session management
      vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session,
        { desc = "[S]ession [S]earch" })
      vim.keymap.set("n", "<leader>sd", ":Autosession delete<CR>",
        { desc = "[S]ession [D]elete" })
    end,
  }
}
