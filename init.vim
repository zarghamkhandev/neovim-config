



" " fzf open
nnoremap <C-p> :GFiles<CR>




" " add small deletes (d w) to numbered registers
if exists("##TextYankPost")
  function! SmallDeleteRing(event) abort
    if a:event['operator'] == 'y'
      " Don't care about actual yanks
      return
    endif
    if a:event['regtype'] ==# 'V'
      " Vim already handles linewise deletions
      return
    endif
    
    let regcontents = a:event['regcontents']
    if len(regcontents) > 1
      " Vim already handles deletions spanning multiple lines
      return
    endif

    let deleted = regcontents[0]

    if len(deleted) == 1
      " Don't want to catch single-character deletions (in particular, x)
      return
    endif

    " Grab registers 1-8
    let one_through_eight = range(1, 8) | call map(one_through_eight, {k, v -> getreg(v)})

    " Set register "1
    call setreg(1, deleted)

    " Set registers 2-9
    for i in range(1, 8)
      call setreg(i + 1, one_through_eight[i - 1])
    endfor
  endfunction

  augroup small_delete_ring
    autocmd!
    autocmd TextYankPost * call SmallDeleteRing(v:event)
  augroup END
endif

