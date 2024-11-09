return {
  "rmagatti/goto-preview",
  event = "BufEnter",
  config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  keys = {
    {
      "gpd",
      function()
        require("goto-preview").goto_preview_definition({})
      end,
      desc = "Preview Definition",
    },
    {
      "gpy",
      function()
        require("goto-preview").goto_preview_type_definition({})
      end,
      desc = "Preview Definition",
    },
    {
      "gpi",
      function()
        require("goto-preview").goto_preview_implementation({})
      end,
      desc = "Preview Definition",
    },
  },
}
