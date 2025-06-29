return {
  {
    'Shatur/neovim-ayu',
    config = function()
      local colors = require 'ayu.colors'
      colors.generate(false)
      local opts = {
        overrides = {
          MiniPickMatchCurrent = { bg = colors.selection_bg },
          MiniPickMatchMarked = { bg = colors.selection_inactive },
        },
      }
      require('ayu').setup(opts)
    end,
  },
}
