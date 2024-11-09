return {
  "nvim-treesitter/nvim-treesitter-context",
  keys = {
    {
      "[p",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Goto previous context",
    },
  },
}
