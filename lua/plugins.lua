local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  	--NVIM-DASHBOARD
	use {'glepnir/dashboard-nvim'}


	use 'navarasu/onedark.nvim'
	require('onedark').setup {
	    style = 'darker'
	}
	require('onedark').load()

	-- Tim Pope Surround
	use 'tpope/vim-surround'

	-- Tim Pope Fugitive
	use 'tpope/vim-fugitive'

	--NVIMTREE
	use {
	'kyazdani42/nvim-tree.lua',
	requires = {
	'kyazdani42/nvim-web-devicons', -- optional, for file icons
	}
	}


	--Lines showing lsp suggestions and information
	use({
	 "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	   config = function()
	require("lsp_lines").setup()
	 end,
	})
	--BUFFERLINE (top line) (deactivated right now)
	--use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	--NEOSCROLL
	use 'karb94/neoscroll.nvim'

	--Ping when changing windows or juming long distances
	use {'edluffy/specs.nvim'}
	--GitSigns
	use {'lewis6991/gitsigns.nvim'}
	
	--LuaLine (Statusline for nvim)
	use {
	  'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	--Glow nvim integration (see markdown preview)
 	use {"ellisonleao/glow.nvim"}

	--Better Tabline
	use {
 	 'romgrk/barbar.nvim',
 	 requires = {'kyazdani42/nvim-web-devicons'}
	}

	--Intend Line
	vim.opt.list = true
	vim.opt.listchars:append "space:⋅"
	vim.opt.listchars:append "eol:↴"
	use {
 	 "lukas-reineke/indent-blankline.nvim",
	config = function()
    	require("indent_blankline").setup { filetype_exclude = { "dashboard" }
    	}
  	end
	}
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
   	}

	-- Put this at the end after all plugins
 	if packer_bootstrap then
    	require('packer').sync()
  	end
end)


--vim.cmd [[packadd packer.nvim]]
--return require('packer').startup(function()
--	use {'glepnir/dashboard-nvim'}
--end)

