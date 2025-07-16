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

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
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

  use {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      check_ts = true,                        -- Use treesitter for better context
      fast_wrap = {
        map = '<C-e>',                        -- Changed from <M-e> to <C-e>
        chars = { '{', '[', '(', '"', "'" },  -- Characters that can wrap
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr'
      },
    })
  end
}

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
