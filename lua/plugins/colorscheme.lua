return{
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "nightfly"
    end
}

--return {
--  "EdenEast/nightfox.nvim",
--
--  config = function()
--    vim.cmd('colorscheme nightfox')
--  end
--}

--return {
--  "ellisonleao/gruvbox.nvim",
--  priority = 1000,
--
--  config = function()
--    require("gruvbox").setup({
--      terminal_colors = true, -- add neovim terminal colors
--      undercurl = true,
--      underline = true,
--      bold = true,
--      italic = {
--        strings = true,
--        emphasis = true,
--        comments = true,
--        operators = false,
--        folds = true,
--      },
--      strikethrough = true,
--      invert_selection = false,
--      invert_signs = false,
--      invert_tabline = false,
--      invert_intend_guides = false,
--      inverse = true, -- invert background for search, diffs, statuslines and errors
--      contrast = "", -- can be "hard", "soft" or empty string
--      palette_overrides = {},
--      overrides = {},
--      dim_inactive = false,
--      transparent_mode = false,
--    })
--    vim.cmd("colorscheme gruvbox")
--  end,
--}

--return {
--	"bluz71/vim-moonfly-colors",
--	name = "moonfly",
--	lazy = false,
--	priority = 1000,
--	config = function()
--	--	require("moonfly").custom_colors({
--	--		bg = "#121212",
--	--		violet = "#ff74b8",
--	--	})
--
--		-- Lua initialization file
--		local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
--		vim.api.nvim_create_autocmd("ColorScheme", {
--			pattern = "moonfly",
--			callback = function()
--				vim.api.nvim_set_hl(0, "Function", { fg = "#74b2ff", bold = true })
--			end,
--			group = custom_highlight,
--		})
--		vim.cmd([[colorscheme moonfly]])
--	end,
--}
