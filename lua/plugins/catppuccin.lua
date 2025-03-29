local catppuccin = {
	"catppuccin/nvim",
	lazy = false, -- Load on startup
	priority = 1000, -- Ensure it loads before other plugins
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
			transparent_background = true,
			integrations = {
				treesitter = true,
				native_lsp = { enabled = true },
				telescope = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				markdown = true,
			},
		})
		vim.cmd("colorscheme catppuccin") -- Apply the theme
	end,
}

return catppuccin
