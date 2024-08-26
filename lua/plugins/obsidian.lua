return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        enable_moveright = true,
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",

    dependencies = {
      --Required.
      "nvim-lua/plenary.nvim",

      --Optional
      "hrsh7th/nvim-cmp",             --Completion of note referenes
      "nvim-telescope/telescope.nvim", --Picker, search and quick-switch functionality
      "nvim-treesitter/nvim-treesitter", --Syntax highlighting
    },

    opts = {
      -- A list of vault names and paths.
      -- Each path should be the path to the vault root. If you use the Obsidian app,
      -- the vault root is the parent directory of the `.obsidian` folder.
      -- You can also provide configuration overrides for each workspace through the `overrides` field.
      workspaces = {
        {
          name = "Notes",
          path = "~/",
        },
        {
          name = "School_Notes",
          path = "~/Documents/Notes/School_Notes",
        },
        {
          name = "CompSci_Notes",
          path = "~/Documents/Notes/CompSci_Notes",
        },
        {
          name = "Daily_Notes",
          path = "~/Documents/Notes/Daily_Notes",
        },
      },

      disable_frontmatter = true,

      mappings = {
        --['gf'] = {
        --action = function()
        --return require("obsidian").util.gf_passthrough()
        --end,
        --opts = {noremap = false, expr = true, buffer = true},
        --},

        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      ui = {
        enable = true,
        update_debouce = 200,
        max_file_length = 5000,
        conceallevel = 2,

        bullets = { char = "-", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
      },

      attachments = {
        img_folder = "~/Documents/Notes/assets",
      },
    },
  },
}
