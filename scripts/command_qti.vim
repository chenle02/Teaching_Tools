set shiftwidth=4
set fdm=marker
set tw=200

" Disable ALE to speed up the editor
let g:ale_enabled = 0

" Change \item to 1.
nmap it cW1.<esc>/item<cr>

" Compile using tex2qti
nmap <leader><leader> :w! %:r<cr> :!sed -i 's/\%{{{//g' %:r <cr> :!text2qti %:r <cr>


" Remove empty lines of the selected region
vmap <leader>p :g/^$/d<cr>

" Choose the correct solution
nmap cc 0i*<Esc>lllx
nmap cx <<0xxxi[*]<Esc><<j
nmap cv <<0xxxi[ ]<Esc><<j

nmap as 0lla<space><Esc>

" let @a="\<ESC>Jx\<ESC>n"
" let @b="nfa"
let @m="\<ESC>>>j"
" let @M="\<ESC>j>6jj"
let @p="\<ESC>j6@m"

" let @r="\<ESC>djV/end{tabular}<cr>cl"


" Format matrix
nmap  fa vie>gv:Tabularize /& <cr>

" Search fail at the end of file, will not go back to the beginning
set nowrapscan


" Clean up solutions part
vmap cl :s/\\quad//g<cr>gv:s/^\s*//<cr>gv:s/\\\\//g<cr>gv:s/&\s\+/\r/g<cr>\s

" Increase one space
vmap ic :s/) /)  /g<cr>:set nohlsearch<cr>
vmap lc :s/) /)/g<cr>:set nohlsearch<cr>

" Next problem:
nmap <space><space> :w<cr>/^[1-9].<cr>jzz

" adding <cr> at the end of the current line.
nmap br A<br><esc>

" Make a group pair
" GROUP
" Pick: 1
" POints per question: 10
"
"
" END_GROUP
let @g="\<Esc>o% Problem No. \<cr>GROUP\<cr>Pick: 1\<cr>Points per question: 10\<cr>\<cr>\<cr>\<cr>END_GROUP\<Esc>kk"
" Go to next GROUP
nmap <space>g /^GROUP<cr>:set nohlsearch<cr>

