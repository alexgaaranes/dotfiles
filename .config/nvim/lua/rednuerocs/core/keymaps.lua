vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- buffer line management
keymap.set("n", "<leader>o", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>n", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- telescope management
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope help tags' })

-- Markdown Toggle
keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", {desc = 'Preview Markdown file'})

-- Comment Toggle
keymap.set("n", "<leader>//", "<cmd>CommentToggle<cr>", {desc = "Comment Toggle Line(s)"})
