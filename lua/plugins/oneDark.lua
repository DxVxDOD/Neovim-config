local oneDark = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "warmer", -- Options: "dark", "darker", "cool", "deep", "warm", "warmer"
			transparent = true,
		})
		require("onedark").load()
	end,
}

return oneDark
