" SECTION: Globally
"==========================================
noremap <C-w><C-c> :bd


" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex noremap <F5>  :!pdflatex
    autocmd FileType tex noremap <C-p> :!mupdf %:p:r.pdf & disown<CR>
    autocmd FileType tex noremap <C-l> :!pdflatex %:p && latexmk -c<CR>
augroup END
