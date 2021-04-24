" noremap <leader><leader> :update<bar>:AsyncRun! lualatex --shell-escape -synctex=1 ~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/LyryxOpenText-2019A-LyryxLearning/text/Textbook-Math211-Spring.tex<CR>
" noremap <leader><space> :silent !zathura ~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/LyryxOpenText-2019A-LyryxLearning/text/Textbook-Math211-Spring.pdf &<CR>

" The following macro is to clean up the array environment.
" let @c='viega*&gv>'
" This is to add exercise numbers
" First search begin{ex}
set nowrapscan
let @n='f%4ly$n$pF.0'
" Use the following to increase the number by one, e.g., 7.4.2 --> 7.4.3
set nowrapscan
let @p='$F.n'

" The following macro is to add -neg for all graphics.
" make sure to search /includegraphics first.
let @r='$F.i-negn'
" This is to add frame numbers
" First search /start slide
set nowrapscan
" let @n='f%4ly$n$pF 0'

" The following macro is to change {\bf ...} to \textcolor{yellow}{\bf ...}. Starting within {}
let @y='F{i\textcolor{yellow!80!black}'


" The following is to open latex file without extension.
" Created one if it does not exist.
noremap gf :e <cfile>.tex<cr>

" The following command will align table
nmap bb viega*&:w<CR>

let g:ChapterNum = 14
let g:Run=  'AsyncRun! lualatex --shell-escape -synctex=1 ~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/slides/Chapter-' . g:ChapterNum . '.tex'
noremap <leader><leader> :update<bar>:exec g:Run<cr>
let g:Pdf=  'AsyncRun! zathura ~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/slides/Chapter-' . g:ChapterNum . '.pdf &'
noremap <leader><space> :exec g:Pdf<cr>


set tw=200
