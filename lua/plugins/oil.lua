local path = require("config.path")

local function toggle_oil(dir)
  require("oil").toggle_float(dir)
end

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
          toggle_oil(path.current_buffer_dir())
        end,
        desc = "Explorer Oil (current buffer dir)",
      },
      {
        "<leader>E",
        function()
          toggle_oil(path.git_root())
        end,
        desc = "Explorer Oil (git root)",
      },
      {
        "<leader>fe",
        function()
          toggle_oil(path.current_buffer_dir())
        end,
        desc = "Explorer Oil (current buffer dir)",
      },
      {
        "<leader>fE",
        function()
          toggle_oil(path.git_root())
        end,
        desc = "Explorer Oil (git root)",
      },
    },
    opts = {
      columns = { "icon" },
      keymaps = {
        ["<Esc>"] = { "actions.close", mode = "n" },
      },
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
