set nowrapscan

" The following is to open latex file without extension.
" Created one if it does not exist.
noremap gf :e <cfile>.tex<cr>

let g:ChapterNum = 1
let g:Run=  'AsyncRun! lualatex --shell-escape -synctex=1 '. expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.tex'
noremap <leader><leader> :update<bar>:exec g:Run<cr>
let g:Pdf=  'AsyncRun! zathura ' . expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.pdf &'
noremap <leader><space> :exec g:Pdf<cr>

set tw=200
