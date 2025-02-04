local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true})
end

-- Quit and Save
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leader>wq", "<CMD>:wq<CR>")
map("n", "<leader>q1", "<CMD>q!<CR>")
map("n", "<leader>qq", "<CMD>qa!<CR>")

-- Insert mode nvigation
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

-- Exit insert mode
map("i", "<C-e>", "<ESC>")

-- New window
map("n", "<leader>h", "<CMD>vsplit<CR>")
map("n", "<leader>v", "<CMD>split<CR>")

-- Window navigation
map("n", "<C-S-h>", "<C-w>h")
map("n", "<C-S-l>", "<C-w>l")
map("n", "<C-S-k>", "<C-w>k")
map("n", "<C-S-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Setting save
map("n", "<C-s>", "<CMD>w<CR>")
map("n", "<leader>w", "<CMD>w<CR>")

-- Setting undo
map("n", "<C-z>", "<CMD>u<CR>")

-- Setting Latex view
map("n", "<leader>lc", ":VimtexCompile<CR>", { noremap = true, silent = true })
map("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })
map("n", "<leader>ls", ":VimtexStop<CR>", { noremap = true, silent = true })
map("n", "<leader>le", ":VimtexErrors<CR>", { noremap = true, silent = true })

