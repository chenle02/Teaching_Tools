" noremap <leader><leader> :update<bar>:AsyncRun! lualatex --shell-escape -synctex=1 ~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/LyryxOpenText-2019A-LyryxLearning/text/Textbook-Math211-Spring.tex<CR>
" noremap <leader><space> :silent !zathura ~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/LyryxOpenText-2019A-LyryxLearning/text/Textbook-Math211-Spring.pdf &<CR>

" The following macro is to clean up the array environment.
" let @c='viega*&gv>'
" This is to add exercise numbers
" First search begin{ex}
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
