-- Create a new file: lua/wylderfan/cpp.lua
local M = {}

-- Set up C++ specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Set indent to be 2 spaces for C/C++ files
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2

    -- Add additional keybindings specific to C++
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
    vim.keymap.set("n", "<leader>ct", "<cmd>ClangdTypeHierarchy<CR>", opts)
    vim.keymap.set("n", "<leader>cm", "<cmd>ClangdSymbolInfo<CR>", opts)
  end,
})

return M
