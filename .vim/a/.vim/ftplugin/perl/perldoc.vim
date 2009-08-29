" put the cursor over a perl function and try backslash-pf to see perldoc
nmap <Leader>pf :!perldoc -f <cword><CR>
"
" " put the cursor over a perl module name and try backslash-pd to see perldoc
nmap <Leader>pd :e `perldoc -ml <cword>`<CR>
"
