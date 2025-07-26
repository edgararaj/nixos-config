#!/usr/bin/env bash

git clone https://github.com/NvChad/starter.git "$HOME/.config/nvim"
cat > "$HOME/.config/nvim/lua/chadrc.lua" <<EOF
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "penumbra_dark",
  statusline = {
    theme = "minimal"
  }
}

M.ui = {
  statusline = {
    theme = "vscode"
  }
}

return M
EOF

cat > "$HOME/.config/nvim/lua/plugins/init.lua" <<EOF
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
}
EOF
