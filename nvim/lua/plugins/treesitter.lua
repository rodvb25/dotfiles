return {
  
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  event = "BufReadPost",
  keys = {
    {"<c-space>", desc = "Increment selection"},
    {"<bs>", desc = "Increment selection", mode = "x"},
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    auto_install = { enable = true },
    ensure_installed = {
      "json",
      "javascript",
      "typescript",
      "html",
      "css",
      "markdown",
      "bash",
      "lua",
      "vim",
      "gitignore",
      "rust",
      "c",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremential = "bs",
      },
    },
  },
  config = function(plugin, opts)
    if plugin.ensure_installed then
      require("lazy.util").deprecate("treesitter.ensure_installed","treesitter.opts.ensure_installed")
    end
    require("nvim-treesitter.configs").setup(opts)
  end
}
