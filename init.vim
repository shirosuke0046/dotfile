" ---------- Getting Start 'vim-plug' ----------
"" For Vim
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"" For Neovim
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" And run :PlugInstall
" ------------------------------
"
call plug#begin()
" Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/seoul256.vim'
call plug#end()

let g:seoul256_background = 235
colo seoul256

" ---------- My Settings ----------
"" キーマッピング
" Y を行末までヤンクに再マッピング
nnoremap Y    y$
" 折り返しててもjkで列移動
nnoremap j    gj
nnoremap k    gk
" +/-で分割した画面を広く/狭くする
nnoremap + <C-W>k<C-W>+<C-W>p
nnoremap - <C-W>k<C-W>-<C-W>p
" 8進数のインクリメント/デクリメントを無効
set nrformats=alpha,hex,bin
" jjで<ESC>
inoremap <silent> jj    <ESC>
" Ste or Vte で画面分割してターミナルを開く
if has('nvim')
  :command Ste    :10split|terminal
  :command Vte    :10vsplit|terminal
endif
" <ESC>でcommand modeにする
tnoremap <silent><ESC>    <C-\><C-n>
" ,による逆方向検索を再マップ
nnoremap \    ,

"" Leader設定
" <Space>をLeaderキーに設定
let mapleader = "\<Space>"
" 行頭行末を押しやすく
nnoremap <Leader>h    ^
nnoremap <Leader>l    $
" 半画面移動を押しやすく
nnoremap <Leader>K    <C-u>zz
nnoremap <Leader>J    <C-d>zz
" ウィンドウ関連
nmap <Leader>w    [window]
nnoremap [window]h    <C-w>h
nnoremap [window]j    <C-w>j
nnoremap [window]k    <C-w>k
nnoremap [window]l    <C-w>l
nnoremap [window]s    :split<CR>
nnoremap [window]v    :vsplit<CR>
" タブ関連
nmap <Leader>t    [tab]
nnoremap [tab]n    :tabnew<CR>
nnoremap [tab]l    gt
nnoremap [tab]h    gT

"" 全体設定
" エンコーディング設定
set encoding=utf-8
" 行番号を表示
set number
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 
" set hidden
" 下方向にウィンドウ分割する
set splitbelow
" 右方向にウィンドウ分割する
set splitright
" 括弧入力時に対応する括弧を表示
set showmatch
" showmatch時の表示時間を0.1sに設定(デフォルト: 0.5s)
set matchtime=1

"" インデント系
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
" 自動インデント設定
set smartindent
" 現在行のインデントを維持する
set autoindent

"" 検索系
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

"" 括弧入力補完
" 括弧入力で中に移動
inoremap ()    ()<Left>
inoremap {}    {}<Left>
inoremap []    []<Left>
inoremap <>    <><Left>
inoremap ''    ''<Left>
inoremap ""    ""<Left>
inoremap ``    ``<Left>
" 左括弧<ENTER>で閉じ括弧補完
inoremap (<CR>    (<CR>)<Left><CR><up><Tab>
inoremap {<CR>    {<CR>}<Left><CR><up><Tab>
inoremap [<CR>    [<CR>]<Left><CR><up><Tab>

"" おまじない
filetype plugin indent on
syntax enable
set nomodeline
