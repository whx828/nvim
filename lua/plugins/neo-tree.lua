return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { "<leader>e",     ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
      { "<leader><tab>", ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
  },
}
