-- Keymaps for betterTerm.nvim
local betterTerm = require('betterTerm')
-- toggle firts term
vim.keymap.set({"n", "t"}, "<C-j>", betterTerm.open, { desc = "Open terminal"})
-- Select term focus
vim.keymap.set({"n"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})

-- Keymaps for windowresize
local resize = function(win, amt, dir)
    return function()
        require("winresize").resize(win, amt, dir)
    end
end
vim.keymap.set("n", "<leader>h", resize(0, 2, "left"))
vim.keymap.set("n", "<leader>j", resize(0, 1, "down"))
vim.keymap.set("n", "<leader>k", resize(0, 1, "up"))
vim.keymap.set("n", "<leader>l", resize(0, 2, "right"))
