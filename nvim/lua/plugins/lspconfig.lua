return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    diagnostic = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●"},
      severity_sort = true,
    },
    autoformat = true,
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    servers = {
      cssls = {},
      html = {},
      jsonls = {},
      tsserver = {},
      lua_ls = {},
      rust_analyzer = {},
      bashls = {},
    },
  },
  config = function()
    require("lspconfig")["cssls"].setup{}
    require("lspconfig")["html"].setup{}
    require("lspconfig")["jsonls"].setup{}
    require("lspconfig")["tsserver"].setup{}
    require("lspconfig")["lua_ls"].setup{}
    require("lspconfig")["rust_analyzer"].setup{}
    require("lspconfig")["bashls"].setup{}
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  end
}
