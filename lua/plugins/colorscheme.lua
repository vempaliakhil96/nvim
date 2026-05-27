return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      -- Your light theme
      set_light_mode = function()
        vim.cmd.colorscheme("github_light_default")
      end,
      -- Your dark theme
      set_dark_mode = function()
        vim.cmd.colorscheme("github_dark_default")
      end,
      -- Fallback for SSH/TTY
      fallback = "dark",
      -- Adjust update interval if needed (milliseconds)
      update_interval = 3000,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
        },
      })
    end,
  },
}
