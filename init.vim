" " map space as leader key
vnoremap <SPACE> <Nop>
nnoremap <SPACE> <Nop>
let mapleader=" "

" " yank inside string
nnoremap <leader>` "+yi`
nnoremap <leader>" "+yi"
nnoremap <leader>' "+yi'

:set ignorecase
:set smartcase
" " Copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>y "+y

" " Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" " move lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" " set scroll off
:set scrolloff=99
:set relativenumber

" " fzf open
nnoremap <C-p> :GFiles<CR>



call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'navarasu/onedark.nvim'
call plug#end()

" " set the theme
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark

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

