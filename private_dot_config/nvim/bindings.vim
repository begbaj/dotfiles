" SECTION: Globally
"==========================================
noremap <C-w><C-c> :bd
noremap <C-w><C-b> :NERDTreeClose


" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex nnoremap <C-p> :!okular %:p:r.pdf & disown<CR>
    autocmd FileType tex nnoremap <F5> :!pdflatex %:p && latexmk -c<CR>
augroup END
