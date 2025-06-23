vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex) -- file viewer
vim.keymap.set("v", "<leader>y", '"+y') -- copy to clipboard buffer
vim.keymap.set("n", "<leader>ya", 'gg"+yG``') -- copy file to clipboard buffer
vim.keymap.set("n", "J", '10j')
vim.keymap.set("n", "K", '10k')

-- Terminal commands
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
-- Create custom terminal command that opens in current directory
vim.api.nvim_create_user_command('Term', function()
    -- Get current file's directory
    local current_dir = vim.fn.expand('%:p:h')
    -- Open terminal in that directory
    vim.cmd('lcd ' .. current_dir)
    vim.cmd('terminal')
end, {})
