vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Harpoon
  use "nvim-lua/plenary.nvim"
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Telescope - pin to working version
  use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.8',  -- Use stable tag instead of commit
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
      {'williamboman/mason.nvim', tag = 'v1.10.0'},
      {'williamboman/mason-lspconfig.nvim', tag = 'v1.29.0'},
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
