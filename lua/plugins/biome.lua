return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local supported = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" }

      opts.formatters_by_ft = opts.formatters_by_ft or {}

      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "biome")
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.biome = {
        require_cwd = true,
      }
      -- Enable this option to avoid conflicts with Prettier.
      vim.g.lazyvim_prettier_needs_config = true
    end,
  },
}
