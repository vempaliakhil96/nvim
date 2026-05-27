## Neovim Configuration

- Verify which explorer plugin is active before changing side-panel behavior. In this config, the side panel may be Snacks Explorer rather than Neo-tree; inspect `lazy-lock.json`, `lazyvim.json`, and `lua/plugins/` first.
- After editing Lua plugin config, run `stylua` on changed files and a headless Neovim load check.
- When `formatters_by_ft` is explicitly set in `lua/plugins/conform.lua`, LazyVim language extras (e.g. `lang.rust`) cannot inject their own formatters. New languages must be added to the existing table manually.
- This config uses `copilot.lua` (zbirenbaum), not `vim-copilot`. `vim.b.copilot_enabled` does nothing here. To disable Copilot per-project, use `vim.cmd("Copilot disable")` in a `.nvim.lua` exrc file.
- Editing a `.nvim.lua` file invalidates its trust hash. After modifying one, re-trust it: `nvim --headless +"lua vim.secure.trust({path='...', action='allow'})" +quit`


## Landing the Plane (Session Completion)

**When ending a work session**, you MUST complete ALL steps below. Work is NOT complete until `git push` succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **PUSH TO REMOTE** - This is MANDATORY:
   ```bash
   git pull --rebase
   bd sync
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Clean up** - Clear stashes, prune remote branches
6. **Verify** - All changes committed AND pushed
7. **Hand off** - Provide context for next session

**CRITICAL RULES:**
- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing - that leaves work stranded locally
- NEVER say "ready to push when you are" - YOU must push
- If push fails, resolve and retry until it succeeds
