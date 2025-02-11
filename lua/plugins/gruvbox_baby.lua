local gruvbox_baby_them = {
    "luisiacc/gruvbox-baby",
    branch = "main",
    lazy = false, -- Load immediately
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
      vim.cmd("colorscheme gruvbox-baby")
    end,
  }

return {}
