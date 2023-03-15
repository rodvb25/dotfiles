return{
  "jose-elias-alvarez/null-ls.nvim",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {"mason.nvim"},
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.eslint,
        nls.builtins.diagnostics.eslint,
        nls.builtins.completion.luasnip,
        nls.builtins.code_actions.eslint_d,
      },
    }
  end,
  config = function()
    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
      on_attach = function(client, bufnr)
       if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre",{
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.formatting_sync()
            end
          })
       end
      end
    })
  end
}
