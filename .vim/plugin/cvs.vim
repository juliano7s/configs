" cvs.vim
" cvs-commandoer i vim
"
" Alle cvs-kommandoer er placeret på ,c efterfulgt af et eller flere tegn
"
" a = add den fil man står i

"commit and reload. File can change if it contains tags
":map ,cc    :!cvs commit %<CR>:e<CR> 
"
"diff. Make a diff and split the window, to show it.


" Made by Rodrigo Mancuso 01/08/2008

" CVS DIFF to last version
noremap ,cd    :!cvs diff % > /tmp/$USER.cvsvimdiffpatch<return>:!patch % /tmp/$USER.cvsvimdiffpatch -R -o /tmp/$USER.cd.%:t<return>:vert diffsplit /tmp/$USER.cd.%:t<return>

" CVS DIFF to version under the cursor
noremap ,cr    :let @z = expand("<cWORD>")<return>:q<return>o<ESC>"zp:!cvs diff -r <cWORD> % > /tmp/$USER.cvsvimdiffrpatch<return>:u<return>:!patch % /tmp/$USER.cvsvimdiffrpatch -R -o /tmp/$USER.cdr.%:t<return>:vert diffsplit /tmp/$USER.cdr.%:t<return>

" CVS ANNOTATE
noremap ,ca    :!cvs annotate % > /tmp/$USER.cvsvimannotate%:t<return>:vert split /tmp/$USER.cvsvimannotate%:t<return>
noremap ,car   :!cvs status % > /tmp/$USER.cvsvimstatus%:t<return>:split /tmp/$USER.cvsvimstatus%:t<return>:/Working revision<CR>www:let @z = expand("<cWORD>")<CR>:bd<return>o<ESC>"zp:!cvs annotate -r <cWORD> % > /tmp/$USER.cvsvimannotate%:t<return>:u<return>:vert split /tmp/$USER.cvsvimannotate%:t<return>

" CVS LOG
noremap ,cl    :!cvs log % > /tmp/$USER.cvsvimlog%:t<return>:split<return><C-w>j:e /tmp/$USER.cvsvimlog%:t<return>

" CVS STATUS
noremap ,cs    :!cvs status % > /tmp/$USER.cvsvimstatus%:t<return>:split /tmp/$USER.cvsvimstatus%:t<return>

" CVS -QN UP
noremap ,cu    :!cvs -qn up \| grep -v ^? > /tmp/$USER.cvsvimup%:t<return>:split<return><C-w>j:e /tmp/$USER.cvsvimup%:t<return>
