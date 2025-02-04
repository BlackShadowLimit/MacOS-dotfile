return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
	},
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason.setup()
      
      local servers = { 
        "pyright", 
        "rust_analyzer", 
        "ts_ls",
		"clangd", 
        "jdtls", 
        "marksman" 
      }

      mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}

