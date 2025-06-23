local M = {}

-- Set up C++ specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Set indent to be 2 spaces for C/C++ files
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2

    local opts = { noremap = true, silent = true }
    -- Switch between header and implementation files
    vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
    -- Show type hierarchy
    vim.keymap.set("n", "<leader>ct", "<cmd>ClangdTypeHierarchy<CR>", opts)
    -- Show detailed symbol info
    vim.keymap.set("n", "<leader>cm", "<cmd>ClangdSymbolInfo<CR>", opts)
  end,
})

return M
