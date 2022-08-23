" SECTION: Globally
"==========================================
noremap <C-a><C-w> :bd<CR>
noremap <C-a><C-b> :NERDTreeClose<CR>


" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex nnoremap <C-p> :!okular %:p:r.pdf & disown<CR>
    autocmd FileType tex nnoremap <F5> :!pdflatex %:p && latexmk -c<CR>
augroup END
