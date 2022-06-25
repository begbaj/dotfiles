" SECTION: Globally
"==========================================
noremap <C-w><C-c> :bd


" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex noremap <C-p> :!okular %:p:r.pdf & disown<CR>
    autocmd FileType tex noremap <F5> :!pdflatex %:p && latexmk -c<CR>
augroup END
