return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Shadow Base",
          path = "/Users/arthur/Library/Mobile Documents/iCloud~md~obsidian/Documents/Shadow Base/",
        },
      },
    })
  end
}
