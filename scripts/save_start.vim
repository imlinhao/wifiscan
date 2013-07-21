"source save_start.vim
let s:x = expand('%:p')
"writefile(getline(1,'$'),bufname('%'))
call writefile(getline(1,'$'), s:x.'_start')
