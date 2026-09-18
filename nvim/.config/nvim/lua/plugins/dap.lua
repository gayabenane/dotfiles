if false then
  return {}
end

return {
  -- 🧠 Core debugger
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- 🧠 C++
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch C++",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- 🐍 Python
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          name = "Launch Python file",
          type = "python",
          request = "launch",
          program = "${file}",
        },
      }
    end,
  },

  -- 🪟 Debug UI (variables, call stack, breakpoints)
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- open UI automatically when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- close UI when debugging stops
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
