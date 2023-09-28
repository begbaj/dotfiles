local dap = require('dap')
local dapui = require("dapui")
-- DAP
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

--- DAP UI
dapui.setup()

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

--- MAPPINGS
vim.keymap.set('n', '<leader>vl', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>vn', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>vi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>vO', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>vb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>vB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>vlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>vdr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>vdl', function() require('dap').run_last() end)

vim.keymap.set('n', '<leader>vu', function() require('dapui').toggle() end )

vim.keymap.set({'n', 'v'}, '<leader>vdh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<leader>vdp', function() require('dap.ui.widgets').preview() end)
vim.keymap.set('n', '<leader>vdf', function() require('dap.ui.widgets').centered_float(widgets.frames) end)
vim.keymap.set('n', '<leader>vds', function() require('dap.ui.widgets').centered_float(widgets.scopes) end)
