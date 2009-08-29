" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
set shiftwidth=4
set tabstop=4
"set expandtab
set cindent
set pastetoggle=<F4>
syntax on
set mouse=a

set t_Co=256
"
"Viajando e mapeando comandos
"map ,w :r !ls<CR>JjiESCREVENDO<ESC>
"isso ai insere o 'ls' na linha debaixo, vai uma vez pra baixo, entra no
"insert mode, escreve 'ESCREVENDO' e sai...

map ,o  :e <cWORD><return> <C-w>o
map ,bf :buffers<return>
map ,b  :buffer 
map ,j  :jumps<return>
map ,do :do<return>
map ,dp :dp<return>
map ,f  :TlistToggle<return>
map ,=  gg=G''
map ,w  :w<return>

" cscope mappings
map ,g  :cs find g <C-R>=expand("<cword>")<CR><CR>
map ,c  :cs find c <C-R>=expand("<cword>")<CR><CR>
map ,s  :cs find s <C-R>=expand("<cword>")<CR><CR>

" git mappings
map ,gb  :!git blame %<return>
map ,gl  :!git log %<return>
map ,gd  :!git diff %<return>

" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
" set linebreak		" Don't wrap words by default
set textwidth=0		" Don't wrap lines by default 
set nowrap
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set scrolloff=5
set sidescroll=10
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.d,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
"if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
"  set t_Co=16
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
map <F2> :WMToggle<CR>
"map + <C-W>+
"map - <C-W>-


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
" syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable('/etc/papersize')
  let s:papersize = matchstr(system('/bin/cat /etc/papersize'), '\p*')
  if strlen(s:papersize)
    let &printoptions = "paper:" . s:papersize
  endif
  unlet! s:papersize
endif

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
noremap ] <C-]>
noremap [ <C-T>
noremap { :tp! 
noremap } :tn!

"Navigate in buffers
map ( :bp!
map ) :bn!

"Opens windows (vertical, horizontal)
map \v <C-W>v<C-W>l
map \s <C-W>s<C-W>j
"Distributes the windows vertically equal and maximum (top is buf. browser)
map `= <C-W>=<C-W>_
map `[ 10<C-W><
map `] 10<C-W>>
map ¬{ 10<C-W>-
map ¬} 10<C-W>+

"navigate in windows
map \l <C-W>l
map \h <C-W>h
map \j <C-W>j
map \k <C-W>k
map \o <C-W>o

map <C-C> :quit
map <C-C><C-C> :bd

"Jump to directory which contains current buffer
map \df :lcd %:p:h<cr>

"Map the toggles
map \n :call Toggle_number()<enter>
map \w :call Toggle_wrap()<enter>

map \cn :cn
map \cp :cp
map \m :make:cnf

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags

"colorscheme buttercream
"colorscheme inkpot
"colorscheme slate
"colorscheme jellybeans
colorscheme gardener
"colorscheme evening
"colorscheme desert256

"hi Comment  ctermfg=darkgrey
set hlsearch
"highlight Cursor gui=NONE guifg=bg guibg=fg

"set number! - exclamação inverte o comando. liga se off, desliga se on
set number
"set nonumber
set incsearch
"set ic
"set cursorcolumn
set cursorline
set smarttab
set wildignore=*.o,*.d
set wildmenu
"set wildmode=longest

"let g:miniBufExplVSplit = 20

" --- Procura
"  -------------------------------------------------------------------------------
"
"  " Procura a palavra sob o cursor nos arquivos .c e .h no diretorio
"  " atual e todos os seus subdiretorios.
  map  <F7>  :vimgrep <cword> ./**/*.[ch]<Return><Return>:copen<Return>
  imap <F7>  <Esc><F7>
"
"  " --- Programação
"  -----------------------------------------------------------------------
"
"  " Salva arquivo e compila o mesmo, exibindo erros, se houver
"  " Requer que o diretório atual seja o diretório base do projeto (comando
    "  chdir)
  map  <F3>  :w<Return>:make -C %:h %:t:r.o<Return><Return>:cwindow<Return>
  imap <F3>  <Esc><F3>
"
"  " --- Revisão de código
"  ------------------------------------------------------------------
"
"  " Vai para o próximo arquivo da lista de diff entre diretórios (plugin
    "  DirDiff)
  map <F5> <C-w>bj<Return>10<C-w>-
"
"  " --- Padronização de
"  código-----------------------------------------------------------
"
"  " Marca (highlight) trechos de código potencialmente fora do padrão.
"
  map <F12> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^=]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[\t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>

  imap <F12> <Esc> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^=]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[ \t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>

"
"  " --- Code Folding
"  -----------------------------------------------------------------------
"
"  " Recolhe o codigo entre chaves
  :set foldmethod=syntax
  :set foldlevel=100
"
"  " mapeia comandos, por exemplo:
 map + zo
 map - zc
"  " zo - abre, zc - fecha, zR - abre tudo, zM - fecha tudo


"cores do minibufexpl
hi MBEVisibleNormal guibg=white ctermbg=white  guifg=black ctermfg=black
hi MBENormal guibg=black ctermbg=black guifg=white ctermfg=white
hi MBEChanged guibg=cyan ctermbg=cyan guifg=black ctermfg=black
hi MBEVisibleChanged guibg=white ctermbg=white  guifg=black ctermfg=black
hi Pmenu ctermbg=white ctermfg=black
hi PmenuSel ctermbg=yellow  ctermfg=black


noremap <C-j> <C-e>
noremap <C-k> <C-y>

map ,h  :call H_to_C(expand('%:e'))<return>
function H_to_C(ext) 
	let ext = a:ext
	echo ext
	if ext == 'c'
		:e %:r.h
	elseif ext == 'h'
		:e %:r.c
	endif
endfunction

" Remap s to go to next word or _
"noremap s :set iskeyword=@,48-57,192-255<CR>w:set iskeyword=@,48-57,_,192-255<CR>
"noremap S :set iskeyword=@,48-57,192-255<CR>b:set iskeyword=@,48-57,_,192-255<CR>
"noremap ds :set iskeyword=@,48-57,192-255<CR>dw:set iskeyword=@,48-57,_,192-255<CR>                                          
"noremap ys :set iskeyword=@,48-57,192-255<CR>yw:set iskeyword=@,48-57,_,192-255<CR>
"noremap das :set iskeyword=@,48-57,192-255<CR>daw:set iskeyword=@,48-57,_,192-255<CR>
"noremap yas :set iskeyword=@,48-57,192-255<CR>yaw:set iskeyword=@,48-57,_,192-255<CR>
