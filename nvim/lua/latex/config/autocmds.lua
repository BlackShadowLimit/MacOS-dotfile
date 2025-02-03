local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd



-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 800 })
  end,
})

-- set highlights after colorscheme
augroup('highlights', { clear = true })
autocmd('ColorScheme', {
  group = 'highlights',
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',
      bold = true,
      nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
      fg = 'yellow',
      bold = true,
      nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
      fg = 'blue',
      bold = true,
      nocombine = true,
    })
    
    local ok, leap = pcall(require, 'leap')
    if ok then
      leap.opts.highlight_unlabeled_phase_one_targets = true
    end
  end,
})

augroup('IncSearchHighlight', { clear = true })
autocmd('CmdlineEnter', {
  group = 'IncSearchHighlight',
  pattern = '/,\\?',
  command = [[ :set hlsearch ]],
})
autocmd('CmdlineLeave', {
  group = 'IncSearchHighlight',
  pattern = '/,\\?',
  command = [[ :set nohlsearch ]],
})
