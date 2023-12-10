local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html"},
})

lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"vue"},
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"bash"},
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"css"},
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json"},
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescript", "javascript"},
})

