runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set hidden
map <silent> <C-n> :noh<CR>
set hls is ic scs
set ts=8 sw=4 sts=4 et
nmap <leader>l :set sw=8 sts=8 noet<CR>
nmap <leader>n :set sw=4 sts=4 et<CR>
set formatoptions+=n2
set tw=72

set list listchars=tab:··,trail:•

set statusline=%f\ %m\ %r%{fugitive#statusline()}\ L%l/%L\ C%v\ [%b][0x%B]

let macvim_hig_shift_movement = 0

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multi = 'vr'
let g:ctrlp_jump_to_buffer = 2

au FileType c       setlocal formatoptions-=t
au FileType css     setlocal sw=4 sts=4
au FileType html    setlocal sw=2 sts=2
au FileType lua     setlocal formatoptions-=t sw=3 sts=3
au FileType python  setlocal formatoptions-=t

au BufRead,BufNewFile PKGBUILD    set ft=sh
au BufRead,BufNewFile *.do        set ft=sh
au BufRead,BufNewFile *.json      set ft=javascript
au BufRead,BufNewFile *.rockspec  set ft=lua
au BufRead,BufNewFile *.wfd       set ft=lua

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
