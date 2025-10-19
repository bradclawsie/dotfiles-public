vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Normal mode mapping
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Insert mode mapping (saves and returns to insert mode)
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })

-- Visual mode mapping (saves and preserves selection)
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })

vim.g.perl_host_prog = "/usr/bin/perl"
