vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use {
	    "williamboman/nvim-lsp-installer",
	    "neovim/nvim-lspconfig",
	}
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- 可选依赖,使目录树文件有好看图标
	    },
	    config = function() require'nvim-tree'.setup {} end
	}
	use {								-- gcc代码注释
	    'numToStr/Comment.nvim',
	    config = function()
	        require('Comment').setup()
	    end
	}
	-- 文件标签页
	use{'akinsho/bufferline.nvim',
	  config = function()
	    require("bufferline").setup{}
	  end
	}

	-- 状态栏
	use{'windwp/windline.nvim',
	  config = function()
	    require('wlsample.basic')
	  end
	}
use {'vim-airline/vim-airline'}
use {'vim-airline/vim-airline-themes'}
use {'mhinz/vim-startify'}
use {'morhetz/gruvbox'}
use {'cdelledonne/vim-cmake'}
end)
