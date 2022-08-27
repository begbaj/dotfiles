" SECTION: Globally
"==========================================
let mapleader='\'
" noremap <C-a><C-w> :bd<CR>

" reload init.vim
nnoremap <F8> :so $MYVIMRC<CR>
" edit init.vim
" nnoremap <F20> :!chezmoi edit ~/.config/nvim/init.vim<CR>


" indent multiple lines in visual mode
vnoremap <tab> >
" untab multiple lines in visual mode
vnoremap <S-tab> <

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Right> zL
nnoremap <Left> zH
nnoremap <Up> <C-u>
nnoremap <Down> <C-d>

" SECTION: fzf.vim
"==========================================

nnoremap <silent> <A-f> :Files<CR>
nnoremap <silent> <A-g> :Rg<CR>

" SECTION: NERDTree
"==========================================

noremap <silent>    <A-b> :NERDTreeToggle<CR>


" SECTION: barbar.vim
"==========================================

" Move to previous/next
" nnoremap <silent>    <A-,> :BufferPrevious<CR>:NERDTreeCWD<CR>:wincmd p<CR>
" nnoremap <silent>    <A-.> :BufferNext<CR>:NERDTreeCWD<CR>:wincmd p<CR>

nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>

" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>

" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" SECTION: CoC
"==========================================
nnoremap <silent> <leader>cf :CocList outline<CR>

" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex nnoremap <C-p> :!okular %:p:r.pdf & disown<CR>
    autocmd FileType tex nnoremap <F5> :!pdflatex %:p && latexmk -c<CR>
augroup END
