local result = vim.api.nvim_exec([[echo expand("%:p")]], true)
vim.keymap.set("n", "<C-F10>", "<Esc>:pyf "..result)
