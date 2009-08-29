
function Toggle_number()
  if &number == 0
    set number
  else
    set nonumber
  endif
  echo &number == 0 ?  "Line Numbering now OFF" : "Line Numbering now ON" 
  return -1
endfunction

function Toggle_wrap()
  if &wrap == 0
    set wrap
  else
    set nowrap
  endif
  echo &wrap == 0 ?  "Line Wrapping now OFF" : "Line Wrapping now ON" 
  return -1
endfunction
