"source save_start_only_time.vim
let s:x = expand('%:p')
"writefile(getline(1,'$'),bufname('%'))
call writefile(getline(1,'$'), s:x.'_only_time')
