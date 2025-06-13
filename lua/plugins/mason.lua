require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
})
local lspconfig = require('lspconfig')

require("mason-lspconfig").setup({
	-- ensure_installed = {
	-- 	"lua_ls",
	-- 	"pylsp",
	-- },
  function (server_name)
    require("lspconfig")[server_name].setup{}
		-- print("server_name: " .. server_name)
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
    }
  }
  end,
})

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}
-- require'lspconfig'.pylyzer.setup{}
