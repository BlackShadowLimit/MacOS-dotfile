return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Python (debugpy)
    dap.adapters.python = {
      type = "executable",
      command = "python3",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = "python3",
      },
    }

    -- C++ (lldb)
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode",
      name = "lldb"
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = "${fileDirname}/${fileBasenameNoExtension}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Java (nvim-jdtls)
    dap.adapters.java = function(callback)
      require("jdtls").setup_dap({ hotcodereplace = "auto" })
      callback({ type = "server", host = "127.0.0.1", port = 5005 })
    end
    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Attach to Java Process",
        hostName = "127.0.0.1",
        port = 5005,
      },
    }

    -- Rust (lldb or codelldb)
    dap.adapters.codelldb = {
      type = "server",
      port = "13000",
      executable = {
        command = "codelldb",
        args = { "--port", "13000" },
      },
    }
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${fileBasenameNoExtension}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- Keymaps
    vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Start/Continue Debugging" })
    vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
    vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
    vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set Conditional Breakpoint" })
    vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
  end,
}

