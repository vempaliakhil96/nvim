-- VS Code-specific keymaps
-- Only loaded when running Neovim inside VS Code
if vim.g.vscode then
  local vscode = require("vscode")

  -- Remap folding keys to VS Code commands
  vim.keymap.set("n", "zM", function()
    vscode.call("editor.foldAll")
  end, { desc = "Fold all" })

  vim.keymap.set("n", "zR", function()
    vscode.call("editor.unfoldAll")
  end, { desc = "Unfold all" })

  vim.keymap.set("n", "zc", function()
    vscode.call("editor.fold")
  end, { desc = "Fold" })

  vim.keymap.set("n", "zC", function()
    vscode.call("editor.foldRecursively")
  end, { desc = "Fold recursively" })

  vim.keymap.set("n", "zo", function()
    vscode.call("editor.unfold")
  end, { desc = "Unfold" })

  vim.keymap.set("n", "zO", function()
    vscode.call("editor.unfoldRecursively")
  end, { desc = "Unfold recursively" })

  vim.keymap.set("n", "za", function()
    vscode.call("editor.toggleFold")
  end, { desc = "Toggle fold" })

  -- Preserve folds during navigation by using gj/gk instead of j/k
  -- This prevents automatic unfolding when moving through folded regions
  vim.keymap.set("n", "j", "gj", { desc = "Move down (display line)" })
  vim.keymap.set("n", "k", "gk", { desc = "Move up (display line)" })
end

return {}
