let hw=7
" noremap <leader><leader> :!lualatex ./SolX_Template.tex 3 true
noremap <leader><leader> :exec Compile()<cr>

function! Compile()
    silent !clear
    :w
    " execute "!" . "lualatex ./SolX_Template.tex ". g:hw ." true"
    execute "!" . "./Prob.sh ". g:hw
endfunction


