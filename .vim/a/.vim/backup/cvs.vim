" cvs.vim
" cvs-commandoer i vim
"
" Alle cvs-kommandoer er placeret på ,c efterfulgt af et eller flere tegn
"
" a = add den fil man står i


"add file. Doesn't change the file
":map ,ca    :!cvs add %<CR>

"admin. I never use that command

"annotate. Maybe a good idea to load it into vim. Even better if annotation can be switched on and off

":map ,cA    :silent !cvs annotate % \| less<cr><C-L>

"bugs: virker ikke hvis der er ændret i den efter commit.
:map ,cA	m'1G:silent !cvs annotate % \| cut -d : -f 1 > %.ann<cr>:vert 33sv %.ann<cr>1G:set scrollbind<cr><C-W><right>:set scrollbind<cr>:syncbind<cr>''

"checkout. What should be checkouted?? 

"commit and reload. File can change if it contains tags
":map ,cc    :!cvs commit %<CR>:e<CR> 

"diff. Make a diff and split the window, to show it.
:map ,cd    :!cvs diff % > /tmp/$user.cvsvimdiff<CR>:diffpatch /tmp/$user.cvsvimdiff<CR>

"edit *
"editors *
"history. 
"init.
"log. Show log for current buffer
:map ,cl    :silent !cvs log % \| less<CR><C-L>

"login *
"logout *
"pserver

"rdiff * - Not implemented yet
"release 
"remove. (dont implement this - deleting of the file is necessary)
"rlog
"rtag *
"server

"status
:map ,cs    :!cvs status %<CR>

"tag * (Tag what?)
"unedit *
"update *
"version
"watch *
"watchers *
