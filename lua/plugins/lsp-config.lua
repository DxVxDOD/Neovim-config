return {
  {
"williamboman/mason.nvim",
  config = function()
    require('mason').setup()
  end
  },
  {
     "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
      ensure_installed = {
          'lua_ls', 'angularls', 'bashls', 'clangd', 'tailwindcss', 'cucumber_language_server',
          'docker_compose_language_service', 'dockerls', 'gopls', 'html', 'ts_ls', 'jsonls', 'vacuum', 'bufls',
          'sqls', 'yamlls', 'zls', 'typos_lsp'
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}
