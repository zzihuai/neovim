local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
--
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
require("lazy").setup({
	{
		"folke/which-key.nvim",
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{
		"github/copilot.vim",
		-- event = "InsertEnter",
	},
	{"folke/tokyonight.nvim"},
	{
		'smoka7/hop.nvim',
		version = "*",
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		}
	},
	{ "tiagovla/scope.nvim", config = true },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'jonarrien/telescope-cmdline.nvim',
		},
		keys = {
			{ 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
			{ '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
			{ '<leader>bb', '<cmd>Telescope buffers<CR>'},
			{ '<leader>ff', '<cmd>Telescope find_files<CR>'},
		},
		opts = {
			extensions = {
				cmdline = {
					-- ... plugin settings ...
				},
			}
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension('cmdline')
		end,
	},
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python"} },
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },

		-- use a release tag to download pre-built binaries
		version = '1.*',
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
	},
	{
		'saghen/blink.nvim',
		-- all modules handle lazy loading internally
		lazy = false,
	},
	{
		{'akinsho/toggleterm.nvim', version = "*", config = true}
	},
	{ "CRAG666/code_runner.nvim",},
	{
		"CRAG666/betterTerm.nvim",
		opts = {
			position = "bot",
			size = 15,
		},
	},
	{
		"yorickpeterse/nvim-window",
		keys = {
			{ "<leader>ww", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
		},
		config = true,
	},
	{
		"pogyomo/winresize.nvim",
	}
})

-- theme
require("theme")

-- treesitter
vim.cmd("TSEnable All")



-- plugins
require("plugins.mason")
require("plugins.tree")
require("plugins.copilot")
require("plugins.hop")
require("plugins.debug")
require("plugins.blink")
require("plugins.keymap")

require("plugins.others")
