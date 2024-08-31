local image_previewer = "chafa"

return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep_glob<cr>", desc = "Find (Live Grep)" },
  },
  opts = {
    previewers = {
      builtin = {
        extensions = {
          ["png"] = image_previewer,
          ["jpg"] = image_previewer,
          ["jpeg"] = image_previewer,
          ["gif"] = image_previewer,
          ["webp"] = image_previewer,
          ["svg"] = image_previewer,
        },
      },
    },
  },
}
