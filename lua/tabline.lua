


-- define a function to get the buffer names in the format of tabs

local function get_tabline()
  local tabline = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    if bufname == '' then
      bufname = '[No Name]'
    end
    tabline = tabline .. '%' .. i .. 'T' .. bufname .. ' '
  end
  return tabline
end

-- set the tabline to the result of the get_tabline() function

