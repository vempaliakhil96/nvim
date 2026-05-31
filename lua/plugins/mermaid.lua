return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "mermaid" })
    end,
  },
  {
    "kevalin/mermaid.nvim",
    ft = { "mermaid" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>mp", "<cmd>MermaidPreview<cr>", ft = "mermaid", desc = "Mermaid preview" },
      { "<leader>mP", "<cmd>MermaidPreviewStop<cr>", ft = "mermaid", desc = "Mermaid stop preview" },
      { "<leader>mf", "<cmd>MermaidFormat<cr>", ft = "mermaid", desc = "Mermaid format" },
      { "<leader>mr", "<cmd>MermaidRender<cr>", ft = "mermaid", desc = "Mermaid render" },
      { "<leader>mc", "<cmd>MermaidCopyURL<cr>", ft = "mermaid", desc = "Mermaid copy preview URL" },
    },
    opts = {
      format = {
        shift_width = 2,
      },
      lint = {
        enabled = vim.fn.executable("mmdc") == 1,
        command = "mmdc",
      },
      preview = {
        renderer = "mermaid.js",
        theme = "dark",
      },
    },
  },
}
