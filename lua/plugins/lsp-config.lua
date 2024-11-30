local servers = {
  'lua_ls', 'angularls', 'bashls', 'clangd', 'tailwindcss', 'cucumber_language_server',
  'docker_compose_language_service', 'dockerls', 'gopls', 'html', 'ts_ls', 'jsonls', 'vacuum', 'bufls',
  'sqls', 'yamlls', 'zls', 'typos_lsp', 'eslint'
}
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ensure_installed = {
          'prettierd'
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = servers
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local server_aliases = {
        bufls = "buf_ls"
      }

      for _, lsp in ipairs(servers) do
        local setup_name = server_aliases[lsp] or lsp
        lspconfig[setup_name].setup({
          capabilities = capabilities
        })
      end

      lspconfig.eslint.setup({
        bin = 'eslint', -- or `eslint_d`
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
