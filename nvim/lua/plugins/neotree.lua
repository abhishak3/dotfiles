return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      window = {
        position = "right",
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ position = "right", toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ position = "right", toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
  },
}
