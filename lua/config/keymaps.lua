-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ct", function()
  local variable = vim.fn.input("Variable name: ")

  if variable == "" then
    return
  end

  local log_statement = string.format("console.log('TEST %s', %s, Date.now())", variable, variable)
  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { log_statement })

  local current_indent = vim.fn.indent(current_line)

  if current_indent > 0 then
    local indent_str = string.rep(" ", current_indent)

    vim.api.nvim_buf_set_lines(0, current_line, current_line + 1, false, { indent_str .. log_statement })
  end
end, { desc = "Insert console.log below current line" })
