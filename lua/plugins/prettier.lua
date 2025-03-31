return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local supported = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for _, ft in ipairs(supported) do
      opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      table.insert(opts.formatters_by_ft[ft], "prettier")
    end

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      condition = function(_, ctx)
        local M = require("conform.util") -- Ensure M is defined
        return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
      end,
    }
  end,
}
