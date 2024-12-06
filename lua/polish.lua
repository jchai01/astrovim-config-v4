-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--
vim.opt.whichwrap:append "<,>,h,l,[,]"

-- xnoremap p P
-- x for only visual mode
-- reason: https://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
vim.keymap.set("x", "p", "P")

-- easier whole word delete while in insert mode
vim.keymap.set("i", "<C-Del>", "<Esc>lce")
vim.keymap.set("i", "<C-H>", "<C-W>") -- <C-H> is the same as ctrl-backspace, <C-BS>

-- treat .js files as .jsx
vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
  "BufWritePre",
  "BufEnter",
}, {
  pattern = "*.js",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_set_option_value("filetype", "javascriptreact", { buf = buf })
  end,
})
