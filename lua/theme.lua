-- Theme configuration for Neovim
require('tokyonight').setup({
		style = 'moon', -- 'night', 'day', 'storm', 'moon'
		-- light_style = "day", -- Light theme style
		-- transparent = true, -- Enable transparent background, There are some issues with this option
		terminal_colors = true, -- Enable terminal colors
		styles = {
				comments = { italic = true }, -- Italic comments
				keywords = { italic = true }, -- Italic keywords
				functions = { bold = true }, -- Bold functions
				variables = {}, -- No special style for variables
		},
})
vim.o.background = "light"
require('tokyonight').load()

-- buffer-line
vim.opt.termguicolors = true
require("bufferline").setup{}

-- scope
require("scope").setup({
    hooks = {
        pre_tab_enter = function()
            -- Your custom logic to run before entering a tab
        end,
    },
})
