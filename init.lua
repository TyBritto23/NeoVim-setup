-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--Plugins
require("vim-options")
require("lazy").setup("plugins")
require("lualine").setup()
--require("obsidian").setup()

--Obsidian Setup
-- Set conceallevel and concealcursor specifically for markdown/obsidian files
--local function set_conceallevel()
--  vim.opt_local.conceallevel = 2    -- Or 1, depending on your preference
--  vim.opt_local.concealcursor = "nc" -- Optional: Adjust concealing behavior for the cursor
--end
--
---- Autocommand to apply conceallevel to markdown/obsidian files
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "markdown", "obsidian" }, -- Adjust pattern as necessary
--  callback = set_conceallevel,
--})
--
----List and checkbox continuation
function _G.continue_list()
  local line = vim.api.nvim_get_current_line()

  if line:match("^%s*[%-%*%+]%s*$") or line:match("^%s*[%-%*%+]%s%[%s?%]%s*$") or line:match("^%s*%d+%.%s*$") then
    -- Delete the line if it's an empty list, checkbox, or ordered list

    -- Schedule the deletion of the current line
    vim.schedule(function()
      local row = vim.api.nvim_win_get_cursor(0)[1] - 1
      vim.api.nvim_buf_set_lines(0, row, row+1, false, { "" })
    end)
    return --vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  end

  -- Checkbox continuation
  if line:match("^%s*[%-%*%+]%s%[.%]%s") then
    -- Match the leading whitespace and the list marker (e.g., -, *, +)
    local checkbox_prefix = line:match("^%s*[%-%*%+]")
    -- Return the new line with the checkbox prefix and `-[ ]`
    return vim.api.nvim_replace_termcodes("<CR>" .. checkbox_prefix .. " [ ] ", true, true, true)
  end

  -- Unordered list continuation
  if line:match("^%s*[%-%*%+]%s") then
    --return vim.api.nvim_replace_termcodes("<CR>" .. line:match("^%s*[%-%*%+]%s") .. " ", true, true, true)
    return vim.api.nvim_replace_termcodes("<CR>- ", true, true, true)
  end

  -- Ordered list continuation
  local num = line:match("^%s*(%d+)%.%s")
  if num then
    num = tonumber(num) + 1
    return vim.api.nvim_replace_termcodes("<CR>" .. num .. ". ", true, true, true)
  end

  -- If not a list or checkbox, just insert a new line
  return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
end

--Only work for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "obsidian" }, -- Match markdown or obsidian files
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<CR>",
      "v:lua.continue_list()",
      { noremap = true, expr = true, silent = true }
    )
  end,
})
