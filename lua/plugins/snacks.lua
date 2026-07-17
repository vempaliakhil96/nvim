local path = require("config.path")

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
        grep_word = {
          hidden = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>/",
      function()
        Snacks.picker.grep({ cwd = path.git_root() })
      end,
      desc = "Grep (git root)",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep({ cwd = path.git_root() })
      end,
      desc = "Grep (git root)",
    },
    {
      "<leader>sG",
      function()
        Snacks.picker.grep({ cwd = path.current_buffer_dir() })
      end,
      desc = "Grep (current buffer dir)",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word({ cwd = path.git_root() })
      end,
      desc = "Visual selection or word (git root)",
      mode = { "n", "x" },
    },
    {
      "<leader>sW",
      function()
        Snacks.picker.grep_word({ cwd = path.current_buffer_dir() })
      end,
      desc = "Visual selection or word (current buffer dir)",
      mode = { "n", "x" },
    },
  },
}
