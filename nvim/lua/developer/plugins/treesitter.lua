return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { 
			"python",
			"java",
			"javascript",
			"cpp",
			"c",
			"rust",
		},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { 
			enable = true 
		},
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
