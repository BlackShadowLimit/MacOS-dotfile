return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
	config = function()
    require("nvim-tree").setup {
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "✗",
              staged = "✓",
              untracked = "★",
              deleted = "",
			},
          },
        },
      },
    }

    vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#61AFEF" })
	end,
  },
}
