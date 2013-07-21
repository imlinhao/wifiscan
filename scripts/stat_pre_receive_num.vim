"source stat_pre_receive_num.vim
let s:lnum = 1
let s:count = 0
while s:lnum<=line('$')
	if match(getline(s:lnum),'mCount:0') >= 0
		let s:count = s:count + 1
	endif
	let s:lnum = s:lnum + 1
endwhile
call append(line('1'),s:count)