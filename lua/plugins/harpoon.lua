return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "[A]ppend harpoon list" })
    vim.keymap.set("n", "<leader>m", function() harpoon:list():remove() end, { desc = "Re[m]ove harpoon list" })
    vim.keymap.set("n", "<leader>0", function() harpoon:list():removeAt(1) end, { desc = "Rem[0]ve first buffer" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "To [1]st buffer" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "To [2]nd buffer" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "To [3]rd buffer" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "To [4]th buffer" })
    -- Toggle previous & next buffers stored within Harpoon lists
    vim.keymap.set("n", "<leader>,", function() harpoon:list():prev() end, { desc = "To prev buffer" })
    vim.keymap.set("n", "<leader>.", function() harpoon:list():next() end, { desc = "To next buffer" })
    -- basic telescope configurations
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
    vim.keymap.set("n", "<leader>o", function() toggle_telescope(harpoon:list()) end, { desc = "[O]pen harpoon window" })
  end,
}

