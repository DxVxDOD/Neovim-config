return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      cssls = {},
      bashls = {},
      buf_ls = {},
      cssmodules_ls = {},
      harper_ls = {},
      somesass_ls = {},
      docker_compose_language_service = {},
      eslint = {},
      dockerls = {},
      taplo = {},
      templ = {},
      terraformls = {},
      tflint = {},
      yamlls = {},
    },
  },
}
