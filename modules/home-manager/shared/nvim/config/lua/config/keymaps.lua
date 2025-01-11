local map = vim.keymap.set

-- Reset terminal navigation
map("t", "<C-w>", "<C-w>")

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", "<cmd>echo 'Use vim motion!<CR>'")
map("n", "<right>", "<cmd>echo 'Use vim motion!<CR>'")
map("n", "<up>", "<cmd>echo 'Use vim motion!<CR>'")
map("n", "<down>", "<cmd>echo 'Use vim motion!<CR>'")

-- Default keymaps
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("i", "jj", "<Esc>")
map("n", "<C-a>", "gg<S-v>G")

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Window navigation
map({ "n", "t" }, "<C-h>", "<C-w>h", { desc = "Go to left window" })
map({ "n", "t" }, "<C-j>", "<C-w>j", { desc = "Go to below window" })
map({ "n", "t" }, "<C-k>", "<C-w>k", { desc = "Go to above window" })
map({ "n", "t" }, "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window
-- map("n", "<C-leader><Left>", "<C-w><", { desc = "Increase window size left" })
-- map("n", "<C-leader><Right>", "<C-w>>", { desc = "Increase window size right" })
-- map("n", "<C-leader><Up>", "<C-w>+", { desc = "Increase window size up" })
-- map("n", "<C-leader><Down>", "<C-w>-", { desc = "Increase window size down" })

-- Tabs
map("n", "te", "tabedit", { desc = "Edit tab" })
map("n", "<tab>", ":tabnext<Return>")
map("n", "<S-tab>", ":tabprev<Return>")
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New [T]ab [O]pen" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab E[x]it" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab [N]ext" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab [P]revious" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "[T]ab Current Bu[f]fer" })

-- Window management
map("n", "<leader>sv", "<c-W>s", { desc = "[S]plit Window [V]ertically" })
map("n", "<leader>sh", "<c-W>v", { desc = "[S]plit Window [H]orizontally" })
map("n", "<leader>se", "<c-W>=", { desc = "[S]plits [E]qual Size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "[S]plit E[x]it" })

-- Vim maximizer
map("n", "<leader>s+", "<cmd>MaximizerToggle<CR>", { desc = "[S]plit Vim Maximizer" })

-- Navigate between quickfix items
map("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "[] Forward qfixlist" })
map("n", "<leader>j", "<cmd>cprev<CR>zz", { desc = "[] Backward qfixlist" })

-- Undo tree
map("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "[U]ndo [T]ree" })

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- -- Scroll window one line up/down -- ??
-- map("i", "<C-e>", "<C-x><C-e>")
-- map("i", "<C-y>", "<C-x><C-y>")

-- Navigation
map("n", "[[", function()
  vim.fn.search("^<(template<bar>script<bar>style)", "bW")
end, { desc = "Function Start" })

map("n", "]]", function()
  vim.fn.search("^<(template)<bar>script<bar>style", "W")
end, { desc = "Function End" })

-- ## PLUGINS ## --
-- SSR
map({ "n", "x" }, "<leader>sr", function() require("ssr").open() end, { desc = "[S]earch [R]eplace (SSR)"})
