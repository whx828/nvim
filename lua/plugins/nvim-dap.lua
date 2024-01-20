return {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local virtual_text = require("nvim-dap-virtual-text")
        local dap_go = require("dap-go")

        dap.adapters.codelldb = {
            type = 'server',
            port = '${port}',
            executable = {
                -- CHANGE THIS to your path!
                command = '/Users/pro/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb',
                args = { '--port', '${port}' },

                -- On windows you may have to uncomment this:
                -- detached = false,
            },
        }
        dap.configurations.rust = {
            {
                name = 'Launch file',
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = function()
                    return coroutine.create(function(dap_run_co)
                        vim.ui.input({ prompt = 'Args > ' }, function(choice)
                            choice = choice or ''
                            local arg = vim.split(choice, ' ') -- TODO: use a function that handles quotes and spaces
                            coroutine.resume(dap_run_co, arg)
                        end)
                    end)
                end,
            },
        }

        dapui.setup()
        -- virtual_text.setup()
        dap_go.setup()
    end
}
