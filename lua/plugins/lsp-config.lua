local servers = {
	"lua_ls",
	"angularls",
	"bashls",
	"clangd",
	"tailwindcss",
	"cucumber_language_server",
	"docker_compose_language_service",
	"dockerls",
	"gopls",
	"html",
	"ts_ls",
	"jsonls",
	"vacuum",
	"buf_ls",
	"sqls",
	"yamlls",
	"zls",
	"typos_lsp",
	"eslint",
  "cssls"
}
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"prettierd",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local server_aliases = {
				bufls = "buf_ls",
			}

			for _, lsp in ipairs(servers) do
				local setup_name = server_aliases[lsp] or lsp
				lspconfig[setup_name].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n", "v" }, "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
}
