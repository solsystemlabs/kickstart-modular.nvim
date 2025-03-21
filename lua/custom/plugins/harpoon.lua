-- Create a new file: lua/custom/plugins/harpoon.lua

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()

    -- Basic keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end,
      { desc = "Harpoon [A]dd file" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon toggle menu" })

    -- Navigation
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
      { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
      { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
      { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
      { desc = "Harpoon file 4" })

    -- Navigate with Control keys (alternative style)
    vim.keymap.set("n", "<A-j>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<A-k>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<A-l>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<A-;>", function() harpoon:list():select(4) end)

    -- Open in splits
    vim.keymap.set("n", "<leader>hs", function()
      local harpoon_list = harpoon:list()
      local item = harpoon_list:next()
      local bufnr = vim.fn.bufnr(item.value)

      vim.cmd("split")
      if bufnr ~= -1 then
        vim.api.nvim_win_set_buf(0, bufnr)
      else
        vim.cmd("edit " .. item.value)
      end
    end, { desc = "Harpoon next in [S]plit" })

    vim.keymap.set("n", "<leader>hv", function()
      local harpoon_list = harpoon:list()
      local item = harpoon_list:next()
      local bufnr = vim.fn.bufnr(item.value)

      vim.cmd("vsplit")
      if bufnr ~= -1 then
        vim.api.nvim_win_set_buf(0, bufnr)
      else
        vim.cmd("edit " .. item.value)
      end
    end, { desc = "Harpoon next in [V]split" })

    -- Split specific files by index
    -- vim.keymap.set("n", "<leader>hs1", function()
    --     local item = harpoon:list():get(1)
    --     if item then
    --         vim.cmd("split " .. item.value)
    --     end
    -- end, { desc = "Harpoon file 1 in split" })
    --
    -- vim.keymap.set("n", "<leader>hv1", function()
    --     local item = harpoon:list():get(1)
    --     if item then
    --         vim.cmd("vsplit " .. item.value)
    --     end
    -- end, { desc = "Harpoon file 1 in vsplit" })

    -- Add similar mappings for files 2-4 if needed

    -- Opens the harpoon file in a split by index
    local function open_file_in_split(index, split_cmd)
      return function()
        local item = harpoon:list():get(index)
        if item then
          vim.cmd(split_cmd .. " " .. item.value)
        end
      end
    end

    -- Register all split variations for files 1-4
    for i = 1, 4 do
      vim.keymap.set("n", "<leader>hs" .. i, open_file_in_split(i, "split"),
        { desc = "Harpoon file " .. i .. " in split" })
      vim.keymap.set("n", "<leader>hv" .. i, open_file_in_split(i, "vsplit"),
        { desc = "Harpoon file " .. i .. " in vsplit" })
    end
  end,
}
