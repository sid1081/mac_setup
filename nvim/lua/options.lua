require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
vim.opt.spelllang = "en_gb"
vim.opt.spell = true

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Spacing / padding
vim.opt.scrolloff = 10       -- keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 8    -- keep 8 columns visible left/right of cursor

-- Auto-open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- Inline diagnostic virtual text
vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}
