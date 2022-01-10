" Slow yaml highlighting workaround
if exists('+regexpengine') && ('&regexpengine' == 0)
  setlocal regexpengine=1
endif
set isfname+=@-@
set path+=./../templates,./../files,templates,files
""" Folding {{{
" :help fold-text
" http://stackoverflow.com/questions/5983396/change-the-text-in-folds
" see: 'fillchars', 'foldtext'
set foldtext=FoldTaskBlock()
fun! FoldTaskBlock()
  let line = getline(v:foldstart)
  "let sub  = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let sub  = substitute(line, '- name: ', '▶ ', 'g')
  "return v:folddashes . sub
  return sub . ' '
endfun

set fillchars=fold:·

" Gets typed so often
iab n: - name:
iab r: register:
iab w: with_items:
iab e: environment:
iab t: tags: [
iab b: become:
"
set foldmethod=syntax
