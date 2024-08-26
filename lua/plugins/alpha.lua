return {
  "goolord/alpha-nvim",
  dependencies = { "echasnovski/mini.icons", "nvim-lua/plenary.nvim" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")
    dashboard.section.header.val = {
[[                                                                        ]],
[[                                                                        ]],
[[                                                                        ]],
[[                                                                      ]],
[[       ████ ██████           █████      ██                      ]],
[[      ███████████             █████                              ]],
[[      █████████ ███████████████████ ███   ███████████    ]],
[[     █████████  ███    █████████████ █████ ██████████████    ]],
[[    █████████ ██████████ █████████ █████ █████ ████ █████    ]],
[[  ███████████ ███    ███ █████████ █████ █████ ████ █████   ]],
[[ ██████  █████████████████████ ████ █████ █████ ████ ██████  ]],
[[                                                                        ]],
[[                                                                        ]],
[[                                                                        ]],
[[                                                                        ]],
}
    alpha.setup(dashboard.opts)
    --require("alpha").setup(require("alpha.themes.theta").config)
  end,
}
