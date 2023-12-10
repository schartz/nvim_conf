local plugins = {

  {
    'stevearc/aerial.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },

    config = function()
      require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialNavToggle<CR>")
    end
  },

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
