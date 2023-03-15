return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  dependencies = "williamboman/mason-lspconfig.nvim",
  keys = {{"<leader>cm", "<cmd>Mason<CR>", desc = "Mason"}},
  opts = {
    automatic_installation = true,
    ui = {
      border = "rounded",
      height = 0.8,
    },
  },
  config = function(opts)
    require("mason").setup(opts)
  end
}
