augroup AU_NAME
    nnoremap <C-p> :!mupdf %:p:r.pdf & disown<CR>
    nnoremap <C-l> :!pdflatex %:p && latexmk -c<CR>
augroup END
