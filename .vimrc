set viminfo='50,\"1000,n~/var/viminfo
set tw=72
filetype plugin indent on
set ruler
set hidden
map <silent> <C-n> :noh<CR>
set hls is ic scs
nmap _ :ls<CR>:b<Space>
set sw=4 sts=4 et
nmap <C-p>l :set sw=8 sts=8 noet<CR>
nmap <C-p>n :set sw=4 sts=4 et<CR>
