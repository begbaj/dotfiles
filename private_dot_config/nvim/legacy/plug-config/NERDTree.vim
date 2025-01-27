let g:NERDTreeWinPos = "right"

augroup VimSetupNerdtree
    " start nerdtree when nvim starts
    autocmd VimEnter * NERDTree | wincmd p
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

