return {
  -- disable builtin snippet support
  { 'garymjr/nvim-snippets', enabled = false },

  -- add luasnip
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
  },

  -- blink.cmp integration
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      snippets = {
        preset = 'luasnip',
      },
    },
  },
}
