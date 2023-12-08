local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    'mg979/vim-visual-multi',
    lazy = false,
    init = function ()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>"
      }
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    keys = {
        { "zR", function() require("ufo").openAllFolds() end },
        { "zM", function() require("ufo").closeAllFolds() end },
        { "K", function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end }
    },
    config = function()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        require("ufo").setup({
            close_fold_kinds = { "imports" },
        })
    end,
  },
}
return plugins
