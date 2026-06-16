# 💤 Neovim Config

Personal Neovim setup, based on the [LazyVim](https://github.com/LazyVim/LazyVim) starter.
This README documents what diverges from the upstream template.

## LazyVim extras enabled

Configured in `lazyvim.json`:

- `coding.yanky`
- `dap.core`
- `lang.kotlin`, `lang.sql`, `lang.typescript`, `lang.yaml`, `lang.rust`, `lang.toml`
- `util.chezmoi`, `util.dot`, `util.startuptime`
- `vscode`

## Options (`lua/config/options.lua`)

- `vim.o.exrc = true` — allow project-local `.nvim.lua` files (trust them with `:lua vim.secure.trust(...)`).
- Block cursor in every mode via `guicursor` and explicit white `Cursor` / `lCursor` highlights.

## Autocmds (`lua/config/autocmds.lua`)

- Removes the `lazyvim_wrap_spell` augroup so spell checking stays off in text / markdown / gitcommit buffers.

## Keymaps (`lua/config/keymaps.lua`)

- `go` (normal) — toggle `CodeCompanionChat`.
- `<leader>w` (normal) — `:w`.
- `y` (visual) — yank and keep the selection / cursor where they were.
- `<M-BS>` / `<M-Del>` / `<Esc><BS>` / `<Esc><Del>` (insert + command) — delete previous word (`<C-w>`).

VS Code-only keymaps live in `lua/plugins/vscode.lua` and only load when `vim.g.vscode` is set. They route `zM/zR/zc/zC/zo/zO/za` to the equivalent VS Code fold commands and remap `j`/`k` to `gj`/`gk` to avoid auto-unfolding while navigating.

## Plugins (`lua/plugins/`)

### Colorscheme — `colorscheme.lua`
- `projekt0n/github-nvim-theme` as the active theme.
- `f-person/auto-dark-mode.nvim` flips between `github_light_default` and `github_dark_default` to follow the system appearance; falls back to dark on SSH/TTY.

### LSP — `lsp.lua`
- Enables `pyright` with workspace-mode analysis, `autoSearchPaths`, and `useLibraryCodeForTypes`.

### Formatting — `conform.lua`
- Explicit `formatters_by_ft`: `stylua` (lua), `fish_indent`, `shfmt`, `prettier` (json), `ruff` (python), `rustfmt`.
- Because this table is set explicitly, language extras can no longer inject their own formatters — add new languages here directly.

### CodeCompanion — `codecompanion.lua`
- `olimorris/codecompanion.nvim` with a custom ACP adapter `rovodev` that shells out to the local `acra-python` project via `uv run rovodev acp`.
- Chat, inline, and cmd strategies use `rovodev`. Log level is `DEBUG`.

### Kotlin — `kotlin.lua`
- Installs `kotlin-lsp`, `ktlint`, and `kotlin-debug-adapter` via Mason.
- Disables LazyVim's default `kotlin_language_server` and `kotlin_lsp` lspconfig servers; uses `AlexandrosAlexiou/kotlin.nvim` instead and points it at the JBR JDK bundled with `kotlin-lsp`.
- Wires `ktlint` into conform for Kotlin files.
- Adds `<leader>k*` keymaps for code actions, quick fix, organize imports, format, symbols, navigation, rename, inlay hints, calls, workspace ops, templates, and debug attach.
- Provides a `:KotlinDebug [port]` command (defaults to JDWP 5005) and clears any legacy `dap.adapters.kotlin` pointing at `kotlin-debug-adapter`.

### Snacks — `snacks.lua`
- Shows hidden files in the Snacks explorer and file picker.

### Other
- `nvim-surround.lua` — `kylechui/nvim-surround` on `VeryLazy`.
- `uv.lua` — `benomahony/uv.nvim` with `picker_integration = true`.
- `kitty-scrollback.lua` — `mikesmithgh/kitty-scrollback.nvim`, lazy-loaded on its commands and the `KittyScrollbackLaunch` user event.

## Conventions

- Format Lua with `stylua` after edits (see `stylua.toml`).
- The active side panel is **Snacks Explorer**, not Neo-tree — check `lazy-lock.json` / `lazyvim.json` before changing side-panel behavior.
- GitHub Copilot is disabled; the LazyVim Copilot extra is not enabled.
