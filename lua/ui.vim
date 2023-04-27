




function! Window() abort
	let height = 60
	let width  = 80

	let buf = nvim_create_buf(v:true, v:false)

	let ui = nvim_list_uis()[0]

	let opts = {'relative': 'editor', 'width': width, 'height': height, 'col': (ui.width/2) - (width/2), 'row': (ui.height/2) - (height/2), 'anchor': 'NW', 'style': 'minimal', 'focusable': v:true }
	let win = nvim_open_win(buf, 1, opts)
	execute "normal :Ex \<CR>"
endfunction
