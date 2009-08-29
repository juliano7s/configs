" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.spice_in   setfiletype spice
  au! BufRead,BufNewFile *.spice_out  setfiletype spice
  au! BufRead,BufNewFile *.ngc        setfiletype perl
  au! BufRead,BufNewFile *.ndl        setfiletype perl
  au! BufRead,BufNewFile *.ntl        setfiletype perl
  au! BufRead,BufNewFile *.lib        setfiletype c
augroup END
