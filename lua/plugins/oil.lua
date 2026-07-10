local startup_cwd = vim.uv.cwd()

return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float(startup_cwd)
        end,
        desc = "Explorer Oil (startup dir)",
      },
      {
        "<leader>E",
        function()
          require("oil").toggle_float(startup_cwd)
        end,
        desc = "Explorer Oil (startup dir)",
      },
      {
        "<leader>fe",
        function()
          require("oil").toggle_float(startup_cwd)
        end,
        desc = "Explorer Oil (startup dir)",
      },
      {
        "<leader>fE",
        function()
          require("oil").toggle_float(startup_cwd)
        end,
        desc = "Explorer Oil (startup dir)",
      },
    },
    opts = {
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 0.9,
        max_height = 0.9,
        border = "rounded",
      },
    },
  },
}
