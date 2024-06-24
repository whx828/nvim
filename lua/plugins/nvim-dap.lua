return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local virtual_text = require("nvim-dap-virtual-text")

    dapui.setup()
    virtual_text.setup()
  end
}
