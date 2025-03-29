-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.keymap.set("n", "<leader>cl", function()
	-- Create input prompt for the variable name

	local variable = vim.fn.input("Variable name: ")

	if variable == "" then
		return -- Exit if no input provided
	end

	-- Create log statement with variable name in both places

	local log_statement = string.format("console.log('TEST %s', %s, Date.now())", variable, variable)

	-- Get current line number

	local current_line = vim.api.nvim_win_get_cursor(0)[1]

	-- Insert the log statement below current line

	vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { log_statement })

	-- Optional: add indentation to match current line

	local current_indent = vim.fn.indent(current_line)

	if current_indent > 0 then
		local indent_str = string.rep(" ", current_indent)

		vim.api.nvim_buf_set_lines(0, current_line, current_line + 1, false, { indent_str .. log_statement })
	end
end, { desc = "Insert console.log below current line" })

vim.keymap.set("v", "<leader>cp", '"+y', { desc = "Copy to system clipboard" })

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
