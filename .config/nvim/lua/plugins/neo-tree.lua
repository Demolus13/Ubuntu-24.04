return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",  -- Use the latest v3.x branch
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Necessary dependency
    "nvim-tree/nvim-web-devicons",  -- File icons, recommended but optional
    "MunifTanjim/nui.nvim",  -- UI components
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,  -- Show hidden files
        },
      },
      window = {
        width = 30,  -- Set the width of the file explorer
        position = "left",  -- Position on the left side of the screen
      },
    })

    -- Set custom background color for Neo-tree window
    -- vim.cmd([[highlight NeoTreeNormal guibg=#0D1017]])

    -- Keybinding
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { noremap = true, silent = true })
  end,
}

