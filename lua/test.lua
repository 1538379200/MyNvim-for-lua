-- 运行当前python脚本
local result = vim.api.nvim_exec([[echo expand("%")]], true)
vim.keymap.set("n", "<C-F10>", "<Esc>:pyf "..result.."<CR>")
