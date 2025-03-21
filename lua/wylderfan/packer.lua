vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	'sainnhe/gruvbox-material',
	as = 'gruvbox-material',
	config = function()
		vim.cmd('colorscheme gruvbox-material')
	end
})
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('tpope/vim-fugitive')
  -- LSP Support
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      }
      }
    end)
