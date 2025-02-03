local colors = {
  foreground = "#FFFFFF",
  background = "#007ACC",
  header_background = "#2C896B"
}

local component_colors = {
  a = { fg = colors.foreground, bg = colors.header_background },
  b = { fg = colors.foreground, bg = colors.background },
  c = { fg = colors.foreground, bg = colors.background },
  x = { fg = colors.foreground, bg = colors.background },
  y = { fg = colors.foreground, bg = colors.background },
  z = { fg = colors.foreground, bg = colors.background },
}

local vscode_theme = {
  normal = component_colors,
  insert = component_colors,
  visual = component_colors,
  replace = component_colors,
  command = component_colors,
  inactive = component_colors,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = vscode_theme,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "NvimTree", "vista" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
