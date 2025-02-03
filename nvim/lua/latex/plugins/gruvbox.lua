return {
  "morhetz/gruvbox",
  priority = 1000,  config = function()
    vim.g.gruvbox_contrast_light = 'soft'
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_sign_column = 'bg0'
    vim.o.background = 'light'
    vim.cmd("colorscheme gruvbox")
  end,
}
