" SECTION: Globally
"==========================================
noremap <C-w><C-c> :bd


" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex noremap <F5> :!pdflatex
augroup END
