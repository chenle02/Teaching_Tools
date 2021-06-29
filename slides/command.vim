set nowrapscan

" The following is to open latex file without extension.
" Created one if it does not exist.
noremap gf :e <cfile>.tex<cr>

" let g:ChapterNum = 4
function! g:SetChapter(number)
  let g:ChapterNum = a:number
  let g:Run=  'AsyncRun! lualatex --shell-escape -synctex=1 '. expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.tex'
  let g:Pdf=  'AsyncRun! zathura ' . expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.pdf &'
endfunction

call g:SetChapter(2)

noremap <M-1> :call g:SetChapter(1)<cr>
noremap <M-2> :call g:SetChapter(2)<cr>
noremap <M-3> :call g:SetChapter(3)<cr>
noremap <M-4> :call g:SetChapter(4)<cr>
noremap <M-5> :call g:SetChapter(5)<cr>

noremap <leader><leader> :update<bar>:exec g:Run<cr>
noremap <leader><space> :exec g:Pdf<cr>

" The following is to make a letter as a vector
noremap <space>v i\vec{<esc>la}<esc>

set tw=280
ab fa \forall
ab ex \exists
ab ba \bigcap
ab bu \bigcup
ab lsup \lim\sup_n A_n
ab linf \lim\inf_n A_n
ab lsupa \limsup_{n\to\infty} a_n
ab linfa \liminf_{n\to\infty} a_n
ab seq \left\{x_n\right\}_{n=1}^\infty
