return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		lazy = false, -- Load on startup
		priority = 1000, -- Ensure it loads before other plugins
		config = function()
			require("lsp_lines").setup()

			-- Disable virtual_text since lsp_lines replaces it
			vim.diagnostic.config({
				virtual_text = false,
			})

			-- Keymap to toggle lsp_lines
			vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
		end,
	},
}
