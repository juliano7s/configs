function! Add_getter_and_setter()
  let @w = "dwi#!DOCo#!FUN [Public,Object] po#!ARG   value : if defined, this function is a setter.o#!RET pa : the pa parameter of the object.o#o# Returns or sets the member variableo#o#!CODosub pa {omy $self = shift;omy $value = shift;oo# It's a setter...oif (defined($value)) {o$self->{'pa'} = $value;o}ooreturn $self->{'pa'};o}=\%%o"
endfunction

function! Add_getter()
  let @w = "dwi#!DOCo#!FUN [Public,Object] po#!RET pa : the pa parameter of the objecto#o# Returns the member variableo#o#!CODosub pa {omy $self = shift;ooif (defined($self->{'pa'})) {oreturn $self->{'pa'};o }ooreturn undef;o}=\%%o"
endfunction

function! Add_method()
  let @w = "dwisub pa {omy $self = shift;o}=\%%okko  "
endfunction

function! Add_self_set()
  let @w = "dwi$self->{'pa'} = $pa;==A"
endfunction

function! Add_quoted_s()
  let @w = "a\\\"%s\\\""
endfunction

function! Add_dumper()
  let @w = "dwi{my $d = new Data::Dumper([$pa]); $d->Maxdepth(5); debug(1, '%s',$d->Dump());}"
endfunction

function! Quote_string()
	let @w = "i\"pa\"a"
endfunction

imap <buffer>  ,gs <Esc>bye:call Add_getter_and_setter()<enter>@w
imap <buffer>  ,gg <Esc>bye:call Add_getter()<enter>@w
imap <buffer>  ,mm <Esc>bye:call Add_method()<enter>@w
imap <buffer>  ,se <Esc>bye:call Add_self_set()<enter>@w
imap <buffer>  ,qs <Esc>:call Add_quoted_s()<enter>@w
imap <buffer>  ,qw <Esc>wbdw:call Quote_string()<enter>@w
imap <buffer>  ,dump <Esc>bye:call Add_dumper()<enter>@w

