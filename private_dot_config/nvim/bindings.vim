" SECTION: Globally
"==========================================
let mapleader='\'

" reload init.vim
nnoremap <F8> :so $MYVIMRC<CR>

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

" Toggle terminal on/off (neovim) (reddit: https://www.reddit.com/r/vim/comments/8n5bzs/using_neovim_is_there_a_way_to_display_a_terminal/)
" nnoremap <A-v> :call TermToggle(12)<CR>
" inoremap <A-v> <Esc>:call TermToggle(12)<CR>
" tnoremap <A-v> <C-\><C-n>:call TermToggle(12)<CR>
" 
" " Terminal go back to normal mode
tnoremap <C-k> <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>

" SECTION: fzf.vim
"==========================================
" nnoremap <silent> <C-f> :Files<CR>
" nnoremap <silent> <C-g> :Rg<CR>


" SECTION: telescope
"==========================================
nnoremap <silent> <C-f> <cmd>Telescope find_files<CR>
nnoremap <silent> <C-g> <cmd>Telescope live_grep<CR>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>




" SECTION: NERDTree
"==========================================
" noremap <silent>    <A-b> :NERDTreeToggle<CR>

" SECTION: NERDTree
"==========================================
noremap <silent>    <A-b> :NvimTreeToggle<CR>

" SECTION: barbar.vim
"==========================================

" Move to previous/next
" nnoremap <silent>    <A-,> :BufferPrevious<CR>:NERDTreeCWD<CR>:wincmd p<CR>
" nnoremap <silent>    <A-.> :BufferNext<CR>:NERDTreeCWD<CR>:wincmd p<CR>

nnoremap <silent>    <A-j> :BufferPrevious<CR>
nnoremap <silent>    <A-k> :BufferNext<CR>

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
" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" SECTION: CoC
"==========================================
" nnoremap <silent> <leader>cf :CocList outline<CR>

" SECTION: GitGutter
"==========================================
" nnoremap <silent> <leader>gt <Plug>(GitGutterToggle)
" nnoremap <silent> <leader>gd <Plug>(GitGutterDisable)
" nnoremap <silent> <leader>ge <Plug>(GitGutterToggle)

" SECTION: HardTime
"==========================================
nnoremap <silent> <leader>ht :HardTimeToggle<CR>

" SECTION: By FileType
"==========================================
augroup LATEX
    autocmd FileType tex nnoremap <C-p> :!okular %:p:r.pdf & disown<CR>
    autocmd FileType tex nnoremap <F5> :!pdflatex %:p && latexmk -c<CR>
augroup END

" SECTION: Vimspector
"==========================================
" nnoremap <Leader>vl :call vimspector#Launch()<CR>
" nnoremap <Leader>vR :call vimspector#Reset()<CR>
" nnoremap <Leader>vc :call vimspector#Continue()<CR>

" nnoremap <Leader>vb :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <Leader>vB :call vimspector#ClearBreakpoints()<CR>

" nmap <Leader>vr <Plug>VimspectorRestart
" nmap <Leader>vO <Plug>VimspectorStepOut
" nmap <Leader>vn <Plug>VimspectorStepInto
" nmap <Leader>vi <Plug>VimspectorStepInto
" nmap <Leader>vo <Plug>VimspectorStepOver
