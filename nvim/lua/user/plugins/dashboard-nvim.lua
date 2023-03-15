require('dashboard').setup({
  theme = 'doom',
  hide = {
    statusline = true,
    tabline = true,
  },
  config = {
    header = {
      '',
      '',
      'Randson',
      '',
      ''
    },

    center = {
      { icon = '  ', desc = 'New file                       ', action = 'enew' },
      { icon = '  ', shortcut = 'SPC f', desc = 'Find file                 Ctrl+p', action = 'Telescope find_files' },
      { icon = '  ', shortcut = 'SPC h', desc = 'Recent files              Ctrl+h', action = 'Telescope oldfiles' },
      { icon = '  ', shortcut = 'SPC g', desc = 'Find Word                 Ctrl+g', action = 'Telescope live_grep' },
    },

    footer = {},
  },
})

vim.cmd([[
  augroup DashboardHighlights
    autocmd ColorScheme * highlight DashboardHeader guifg=#6272a4
    autocmd ColorScheme * highlight DashboardCenter guifg=#f8f8f2
    autocmd ColorScheme * highlight DashboardShortcut guifg=#bd93f9
    autocmd ColorScheme * highlight DashboardFooter guifg=#6272a4
  augroup end
]])

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })

