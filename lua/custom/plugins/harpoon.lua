-- In your lazy.nvim configuration file (typically lua/plugins.lua or similar)

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- Make sure to use the harpoon2 branch
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        }
      })

      -- REQUIRED: Basic keymaps
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
        { desc = "Harpoon: Add file" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "Harpoon: Toggle quick menu" })

      -- Navigation keymaps
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
        { desc = "Harpoon: Go to file 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
        { desc = "Harpoon: Go to file 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
        { desc = "Harpoon: Go to file 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
        { desc = "Harpoon: Go to file 4" })

      -- Alternative navigation using Control
      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

      -- Next/previous navigation
      vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end,
        { desc = "Harpoon: Go to next mark" })
      vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end,
        { desc = "Harpoon: Go to previous mark" })

      -- Optional: Telescope integration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
        { desc = "Harpoon: Open in Telescope" })
    end,
  }
}
