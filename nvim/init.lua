vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })

vim.g.perl_host_prog = "/usr/bin/perl"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        },
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", '<cmd>Telescope find_files<cr>', { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", '<cmd>Telescope live_grep<cr>', { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", '<cmd>Telescope buffers<cr>', { desc = "Find Buffers" })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
  },

  -- [[ Comment.nvim Keymaps ]]
  --
  -- This plugin provides "operators" that work with motions.
  -- 'gc' is for line comments (e.g., //)
  -- 'gb' is for block comments (e.g., /* ... */)

  -- --- Normal Mode (Line Comments) ---
  -- gc + [motion]
  --   gcc   - Toggle comment for the current line
  --   gc5j  - Toggle comment for the 5 lines below
  --   gcG   - Toggle comment from cursor to end of file
  --   gcap  - Toggle comment for the current paragraph
  --   gcaw  - Toggle comment for the current word

  -- --- Visual Mode (Line Comments) ---
  -- Select text (v, V, Ctrl-v) and press 'gc'
  --   gc    - Toggles line comments for each line in the visual selection.
  --           (This keymap is often set manually in the config, as shown in the plugin setup)

  -- --- Normal Mode (Block Comments) ---
  -- gb + [motion]
  --   gbc   - Toggle block comment for the current line
  --   gbap  - Toggle block comment for the current paragraph (as a single block)
  --   gbiw  - Toggle block comment for the inner word

  -- --- Visual Mode (Block Comments) ---
  -- Select text (v, V, Ctrl-v) and press 'gb'
  --   gb    - Adds a single block comment around the entire visual selection.
  --           (e.g., /* selected text */)

  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require('Comment').setup(opts)
      vim.keymap.set('v', 'gc', '<Plug>(Comment.nvim)', { silent = true, desc = "Comment visual selection" })
    end
  },

})
