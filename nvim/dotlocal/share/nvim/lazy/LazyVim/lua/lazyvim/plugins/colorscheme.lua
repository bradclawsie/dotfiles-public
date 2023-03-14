return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    opts = { style = "night" },
  },

  -- onedarkpro https://github.com/olimorris/onedarkpro.nvim
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}
