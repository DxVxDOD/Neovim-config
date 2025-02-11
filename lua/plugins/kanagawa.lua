local kanagawa = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		local kanagawa = require("kanagawa")
		kanagawa.setup({})
		vim.cmd("colorscheme kanagawa-dragon")
		kanagawa.setup_adaptive()
	end,
}

return {}
