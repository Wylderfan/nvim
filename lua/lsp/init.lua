local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Mason Setup
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { 
    -- Add the language servers you want to install here
    "lua_ls",
    "pyright",
    "vimls",
    "clangd",
    "gopls",
    "bashls",
    "dockerls",
  }
})

-- Completion setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- LSP setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP keybindings
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

-- Setup language servers
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Disable third party checking
      },
      -- Do not send telemetry data
      telemetry = {
        enable = false,
	},
},
},

})
-- Python setup (will work with PyGame)
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace"
      }
    }
  }
})

-- Vim script setup
lspconfig.vimls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Add more language servers as needed, for example:
-- lspconfig.pyright.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })
