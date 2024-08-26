return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local markdown = require("markview")

    markdown.setup({
      modes = { "n", "no", "i" },
      hybrid_modes = { "i" },
      buf_ignore = { "nofile" },

      headings = {
        enable = true,
        shift_width = 0,
      },

      horizontal_rules = {
        enable = true,

        parts = {
          {
            type = "repeating",

            repeat_amount = vim.api.nvim_win_get_width(0),
            text = "-",
            hl = "Special",
          },
        },
      },

      block_quotes = {
        enable = true,

        default = {
          border = "▋",
        },
        callouts = nil,

        match_string = "",
        callout_preview = "",
        custom_title = false,
        custom_icon = nil,
        border = "▋",
        border_hl = nil,
      },

      checkboxes = {
        enable = true,

        unchecked = { text = " 󰄱 " },
        checked = { text = "  " },
      },

      html = {
        enable = true,

        tags = {},
        entities = {},
      },

      list_items = {
        enable = true,
        shift_width = 4,
        indent_size = 2,

        marker_minus = {},
        marker_plus = {},
        marker_star = {},
        marker_dot = {},
      },
    })

    vim.cmd("Markview enableAll")
  end,
}
