" ---------- 'vim-plug' ----------
call plug#begin()
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" seoul256
let g:seoul256_background = 235
colo seoul256

" vim-airline
let g:airline_theme='fruit_punch'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" --------- setting ----------
" エンコーディング設定
set encoding=utf-8
" ファイル読み込み時のエンコーディング
set fileencodings=ucs-bombs,utf-8,cp932

" 行番号を表示
set number
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時に対応する括弧を表示
set showmatch
" showmatch時の表示時間を0.1sに設定(デフォルト: 0.5s)
set matchtime=1

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden
" 保存されていないファイルがあるときは終了前に保存確認
set confirm

" 下方向にウィンドウ分割する
set splitbelow
" 右方向にウィンドウ分割する
set splitright

" 半角スペース何個で<Tab>１個とカウントするか
set tabstop=4
" 自動インデントを半角スペース何個分とするか
set shiftwidth=4
" Tabを押したときに半角スペースを何個挿入するか
set softtabstop=4
" 半角スペースを<Tab>に変換しない
set expandtab
" 不可視文字を可視化(<Tab>が「▸---」と表示される)
set list listchars=tab:\▸\-
" 現在行のインデントを維持する
set autoindent
" 自動インデント設定
set smartindent

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <Esc><Esc>    :nohlsearch<CR><Esc>

if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif

" --------- key mapping ----------
" jjで<ESC>
inoremap <silent> jj    <ESC>

" Y を行末までヤンクに再マッピング
nnoremap Y    y$

" ,による逆方向検索を再マップ
nnoremap \    ,

" バッファ切り替え
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" ---------- leader ----------
" <Space>をLeaderキーに設定
let mapleader = "\<Space>"

" ---------- おまじない ----------
filetype plugin indent on
syntax enable
set nomodeline
