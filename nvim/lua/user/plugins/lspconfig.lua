require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Elixir
require('lspconfig').elixirls.setup({ capabilities = capabilities })

-- Typescript
require('lspconfig').tsserver.setup({ capabilities = capabilities })

-- Tailwind
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })


vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', { buffer = bufnr })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
-- vim.keymap.set(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
-- vim.keymap.set(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { buffer = bufnr })

-- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
-- vim.keymap.set('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', { buffer = bufnr })
-- vim.keymap.set('n', '<leader>ca', ':Telescope lsp_code_actions<CR>', { buffer = bufnr })
-- vim.keymap.set('v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>', { buffer = bufnr })
-- vim.keymap.set('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { buffer = bufnr })
-- vim.keymap.set('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], { buffer = bufnr })

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    }
  }
})

-- YAML
require('lspconfig').yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
    }
  }
})


vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
