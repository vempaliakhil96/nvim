return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    adapters = {
      acp = {
        rovodev = function()
          local helpers = require("codecompanion.adapters.acp.helpers")
          return {
            name = "rovodev",
            type = "acp",
            formatted_name = "RovoDev",
            roles = {
              llm = "assistant",
              user = "user",
            },
            opts = {
              verbose_output = true,
            },
            env = {
              USER_EMAIL = "avempali@atlassian.com",
            },
            commands = {
              default = {
                "uv",
                "run",
                "--project",
                "/Users/avempali/Documents/repos/acra-python/",
                "rovodev",
                "acp",
              },
            },
            defaults = {},
            parameters = {
              protocolVersion = 1,
              clientCapabilities = {
                fs = { readTextFile = true, writeTextFile = true },
              },
              clientInfo = {
                name = "CodeCompanion.nvim",
                version = "1.0.0",
              },
            },
            handlers = {
              setup = function(self)
                return true
              end,
              form_messages = function(self, messages, capabilities)
                return helpers.form_messages(self, messages, capabilities)
              end,
              on_exit = function(self, code) end,
            },
          }
        end,
      },
    },
    strategies = {
      chat = {
        adapter = "rovodev",
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "copilot",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
  },
}
