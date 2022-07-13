local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  	--NVIM-DASHBOARD
	use {'glepnir/dashboard-nvim'}
	  	
	--NVIMTREE
	use {
	  'kyazdani42/nvim-tree.lua',
  		requires = {
    		'kyazdani42/nvim-web-devicons', -- optional, for file icons
 		 },
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	--BUFFERLINE (top line) (deactivated right now)
	--use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	--NEOSCROLL
	use 'karb94/neoscroll.nvim'
	
	--GitSigns
	use {'lewis6991/gitsigns.nvim'}
	
	--LuaLine (Statusline for nvim)
	use {
	  'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	--Intend Line 
	use {
 	 "lukas-reineke/indent-blankline.nvim",
	config = function()
    	require("indent_blankline").setup { filetype_exclude = { "dashboard" }
    	}
  	end
	}
	--use {
        --'nvim-treesitter/nvim-treesitter',
        --run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
   	-- }

	-- Put this at the end after all plugins
 	if packer_bootstrap then
    	require('packer').sync()
  	end
end)


--vim.cmd [[packadd packer.nvim]]
--return require('packer').startup(function()
--	use {'glepnir/dashboard-nvim'}
--end)

