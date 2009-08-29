function! Add_getter_and_setter()
  let @w = "dwi#!DOCo#!FUN [Public,Object] po#!ARG   value : if defined, this function is a setter.o#!RET pa : the pa parameter of the object.o#o# Returns or sets the member variableo#o#!CODosub pa {omy $self = shift;omy $value = shift;oo# It's a setter...oif (defined($value)) {o$self->{'pa'} = $value;o}ooif (defined($self->{'pa'})) {oreturn $self->{'pa'};o }ooreturn undef;o}=\%%o"
endfunction

function! Add_getter()
  let @w = "dwi#!DOCo#!FUN [Public,Object] po#!RET pa : the pa parameter of the objecto#o# Returns the member variableo#o#!CODosub pa {omy $self = shift;ooif (defined($self->{'pa'})) {oreturn $self->{'pa'};o }ooreturn undef;o}=\%%o"
endfunction

function! Add_method()
  let @w = "dwisub pa {omy $self = shift;o}=\%%okko  "
endfunction

imap <buffer>  ,gs <Esc>bye:call Add_getter_and_setter()<enter>@w
imap <buffer>  ,gg <Esc>bye:call Add_getter()<enter>@w
imap <buffer>  ,mm <Esc>bye:call Add_method()<enter>@w

