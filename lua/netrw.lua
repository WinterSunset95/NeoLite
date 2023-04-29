vim.g.netrw_winsize = 20
vim.g.netrw_browse_split = 3
vim.g.netrw_chgwin = 1

--vim.g.netrw_liststyle = 1
--vim.g.netrw_altfile = 1
--vim.g.netrw_altv = 1
--vim.g.netrw_keepdir = 0
--vim.g.netrw_banner = 0
--vim.g.netrw_sort_sequence = 't'
--vim.g.netrw_list_hide = '*.swp,*.pyc'
--vim.g.netrw_list_hidebuflisted = 1
--vim.g.netrw_altfilecmd = ''
--vim.g.netrw_altdelete = 1

function close_all_netrw()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
		local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
		if buftype == '' and filetype == 'netrw' then
			vim.cmd("silent! execute '" .. bufnr .. "bwipeout'")
			return true
		end
	end
	return false
end


function check_netrw()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
		local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
		if buftype == '' and filetype == 'netrw' then
			return true
		end
	end
	return false
end

--  Iterate through tabs

function iter_tabs()
	for i=1,vim.fn.tabpagenr('$') do
		vim.api.nvim_set_current_tabpage(i)
		vim.cmd('Vex')
	end
end

-- Function to toggle netrw on/off for all tabs
function toggle_netrw()
	local status = check_netrw()
	if status == true then
		close_all_netrw()
	else
		iter_tabs()
	end
end

vim.cmd('source lua/ui.vim')

--vim.cmd([[
--	au TabNew * lua close_all_netrw()
--]])

vim.cmd([[
	au TabNew * call NewTab()
	function NewTab()
		Vexplore!
		wincmd h
		vertical resize 30
		wincmd l
	endfunction
]])

-- Create mapping for <leader>e to toggle netrw
vim.api.nvim_set_keymap('n', '<leader>e', ':lua toggle_netrw()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':wincmd w<CR>', { noremap = true, silent = true })
