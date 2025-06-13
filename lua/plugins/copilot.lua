-- suggest 为win+space
vim.keymap.set('i', '<Win-Space>', function()
	vim.cmd('Copilot suggestion')
end, { noremap = true, silent = true })

-- accept_word 为ctrl+l
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')

