vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fv", vim.cmd.Ex) -- file viewer
vim.keymap.set("v", "<leader>y", '"+y') -- copy to clipboard buffer
vim.keymap.set("n", "<leader>ya", 'gg"+yG``') -- copy file to clipboard buffer
vim.keymap.set({"n", "v"}, "J", '10j')
vim.keymap.set({"n", "v"}, "K", '10k') -- 10x jumps with K and J
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- easy highlight removal

-- Clear search highlights with Escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better window navigation with Ctrl+hjkl
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Create splits
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { desc = '[V]ertical [S]plit' })
vim.keymap.set('n', '<leader>hs', ':split<CR>', { desc = '[H]orizontal [S]plit' })

local harpoon = require("harpoon")
harpoon:setup() -- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>t", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Save undo history
vim.o.undofile = true

