vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex) -- file viewer
vim.keymap.set("v", "<leader>y", '"+y') -- copy to clipboard buffer
vim.keymap.set("n", "<leader>ya", 'gg"+yG``') -- copy file to clipboard buffer
vim.keymap.set({"n", "v"}, "J", '10j')
vim.keymap.set({"n", "v"}, "K", '10k')

local harpoon = require("harpoon")
harpoon:setup() -- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>t", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)
