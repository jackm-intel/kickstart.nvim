local M = {}

-- Define keymaps for LSP
function M.get_keymaps()
  return {
    { '<leader>cl', '<cmd>LspInfo<CR>', desc = 'Lsp Info' },
    { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
    { 'gr', vim.lsp.buf.references, desc = 'References' },
    { 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
    { 'gy', vim.lsp.buf.type_definition, desc = 'Goto Type Definition' },
    { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
    { 'K', vim.lsp.buf.hover, desc = 'Hover' },
    { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
    { '<c-k>', vim.lsp.buf.signature_help, mode = 'i', desc = 'Signature Help' },
    { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action', mode = { 'n', 'v' } },
    { '<leader>cc', vim.lsp.codelens.run, desc = 'Run Codelens' },
    { '<leader>cC', vim.lsp.codelens.refresh, desc = 'Refresh Codelens' },
    { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename' },
  }
end

-- Attach keymaps to LSP buffer
function M.on_attach(client, bufnr)
  local keymaps = M.get_keymaps()

  for _, map in ipairs(keymaps) do
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set(map.mode or 'n', map[1], map[2], opts)
  end
end

return M
