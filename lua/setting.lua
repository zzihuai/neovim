--开启终端颜色
vim.o.termguicolors = true
--行号
vim.o.number = true
vim.o.relativenumber = true
--自动缩进
vim.o.exrc = true
--关闭安全模式
vim.g.secure = false
--鼠标支持
vim.o.cursorline = true
--tab
vim.o.expandtab = false
vim.o.smarttab = true

--undo file
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('config') .. '/undo'

--clipboard
vim.o.clipboard = 'unnamedplus'

--搜索


--代理
-- vim.g.plug_proxy = 'https://127.0.0.1:7890'

vim.opt.cursorline = true   -- 高亮当前行
vim.opt.cursorcolumn = true -- 高亮当前列
