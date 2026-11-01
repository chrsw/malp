" ~/.vim/after/ftplugin/mips.vim
" Settings for MIPS assembly buffers (filetype=mips).

" Treat directives like .asciiz and FP ops like add.s as one word, so K,
" * and CTRL-] grab the whole name.
setlocal iskeyword+=.

setlocal commentstring=#\ %s
setlocal comments=:#

" K looks up the word under the cursor in ~/.vim/doc/mips.txt.
function! s:MipsHelp(word) abort
  " Strip a leading $ and a trailing : or , in case they were selected.
  let l:w = substitute(a:word, '^\$\|[:,]$', '', 'g')
  try
    execute 'help mips-' . l:w
  catch /^Vim\%((\a\+)\)\=:E149/
    echohl WarningMsg
    echo 'No MIPS help for "' . l:w . '"'
    echohl None
  endtry
endfunction

command! -buffer -nargs=1 MipsHelp call s:MipsHelp(<q-args>)
setlocal keywordprg=:MipsHelp

" Undo these settings if the filetype changes.
let s:undo = 'setlocal iskeyword< commentstring< comments< keywordprg<'
      \ . ' | silent! delcommand MipsHelp'
let b:undo_ftplugin = empty(get(b:, 'undo_ftplugin', ''))
      \ ? s:undo : b:undo_ftplugin . ' | ' . s:undo
