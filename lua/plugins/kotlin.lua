local function kotlin_lsp_bundled_jdk()
  local mason_package = vim.fn.expand("$MASON/packages/kotlin-lsp")
  local matches = vim.fn.glob(mason_package .. "/kotlin-server-*/jbr/Contents/Home", false, true)

  return matches[1]
end

local function clear_legacy_kotlin_dap_adapter()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end

  local adapter = dap.adapters.kotlin
  if type(adapter) == "table" and adapter.command == "kotlin-debug-adapter" then
    dap.adapters.kotlin = nil
  end
end

local function kotlin_debug(port)
  clear_legacy_kotlin_dap_adapter()

  local config = {}
  if port then
    config.port = port
  end

  require("kotlin.dap").start(config)
end

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "kotlin-lsp", "ktlint", "kotlin-debug-adapter" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = { enabled = false },
        kotlin_lsp = { enabled = false },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.kotlin = { "ktlint" }
    end,
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
  },
  {
    "AlexandrosAlexiou/kotlin.nvim",
    ft = { "kotlin" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "stevearc/oil.nvim",
      "folke/trouble.nvim",
    },
    keys = {
      { "<leader>ka", "<cmd>KotlinCodeActions<cr>", desc = "Kotlin code actions" },
      { "<leader>kq", "<cmd>KotlinQuickFix<cr>", desc = "Kotlin quick fix" },
      { "<leader>ko", "<cmd>KotlinOrganizeImports<cr>", desc = "Kotlin organize imports" },
      { "<leader>kf", "<cmd>KotlinFormat<cr>", desc = "Kotlin format" },
      { "<leader>ks", "<cmd>KotlinSymbols<cr>", desc = "Kotlin document symbols" },
      { "<leader>kS", "<cmd>KotlinWorkspaceSymbols<cr>", desc = "Kotlin workspace symbols" },
      { "<leader>kt", "<cmd>KotlinTypeDefinition<cr>", desc = "Kotlin type definition" },
      { "<leader>ki", "<cmd>KotlinImplementation<cr>", desc = "Kotlin implementation" },
      { "<leader>kr", "<cmd>KotlinReferences<cr>", desc = "Kotlin references" },
      { "<leader>kn", "<cmd>KotlinRename<cr>", desc = "Kotlin rename" },
      { "<leader>kh", "<cmd>KotlinInlayHintsToggle<cr>", desc = "Kotlin toggle inlay hints" },
      { "<leader>kH", "<cmd>KotlinHintsToggle<cr>", desc = "Kotlin toggle hint diagnostics" },
      { "<leader>kc", "<cmd>KotlinIncomingCalls<cr>", desc = "Kotlin incoming calls" },
      { "<leader>kC", "<cmd>KotlinOutgoingCalls<cr>", desc = "Kotlin outgoing calls" },
      { "<leader>ke", "<cmd>KotlinExportWorkspaceToJson<cr>", desc = "Kotlin export workspace" },
      { "<leader>kx", "<cmd>KotlinCleanWorkspace<cr>", desc = "Kotlin clean workspace" },
      { "<leader>kT", "<cmd>KotlinNewFromTemplate<cr>", desc = "Kotlin new from template" },
      {
        "<leader>kd",
        function()
          kotlin_debug()
        end,
        desc = "Kotlin debug attach",
      },
    },
    opts = {
      root_markers = {
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts",
        "pom.xml",
        "mvnw",
        "gradlew",
        ".git",
      },
      jdk_for_symbol_resolution = kotlin_lsp_bundled_jdk(),
      jvm_args = { "-Xmx4g" },
      inlay_hints = {
        enabled = true,
        parameters = true,
        parameters_compiled = true,
        parameters_excluded = false,
        types_property = true,
        types_variable = true,
        function_return = true,
        function_parameter = true,
        lambda_return = true,
        lambda_receivers_parameters = true,
        value_ranges = true,
        kotlin_time = true,
      },
      folding = { enabled = true },
      file_templates = { enabled = true },
    },
    config = function(_, opts)
      vim.env.JAVA_HOME = vim.env.JAVA_HOME or kotlin_lsp_bundled_jdk()

      local kotlin = require("kotlin")
      kotlin.setup(opts)
      if vim.bo.filetype == "kotlin" then
        kotlin.setup_kotlin_lsp(opts)
      end

      vim.api.nvim_create_user_command("KotlinDebug", function(command_opts)
        local port
        if command_opts.args and command_opts.args ~= "" then
          port = tonumber(command_opts.args)
          if not port then
            vim.notify("kotlin.nvim: invalid port: " .. command_opts.args, vim.log.levels.ERROR)
            return
          end
        end

        kotlin_debug(port)
      end, {
        nargs = "?",
        force = true,
        desc = "Attach debugger to a Kotlin/JVM process (optional JDWP port, default 5005)",
      })
    end,
  },
}
