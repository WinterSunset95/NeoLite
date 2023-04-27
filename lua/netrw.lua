





vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4
--vim.g.netrw_sort_sequence = 't'
--vim.g.netrw_list_hide = '*.swp,*.pyc'
--vim.g.netrw_list_hidebuflisted = 1
vim.g.netrw_keepdir = 0
vim.g.netrw_chgwin = 1
--vim.g.netrw_altfilecmd = ''
vim.g.netrw_altv = 1
--vim.g.netrw_altdelete = 1

vim.cmd([[
	au FileType netrw au BufLeave <buffer> :bd
]])
