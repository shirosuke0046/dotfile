" Getting Start dein
" mkdir -p ~/.config/nvim/dein
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.config/nvim/dein
" rm ./installer.sh
" mkdir -p ~/.config/nvim/after/ftplugin

" ---------- dein script Start ----------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')
 
  " dein
  call dein#add('~/.config/nvim/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " deosnippet
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " インデントラインを表示してくれる
  call dein#add('Yggdroot/indentLine')

  " gccでコメント/アウト
  call dein#add('tpope/vim-commentary')

  " 対応する括弧の変更ができる
  call dein#add('tpope/vim-surround')

  " :NERDTreeToggleでファイルツリーの表示プラグイン
  call dein#add('scrooloose/nerdtree')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" ---------- dein script End ---------------

" ---------- deosnippet setting Start ---------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" ---------- deosnippet setting End ---------------

" ---------- My Settings ----------

"" Plugin設定
" deoplete有効化
let g:deoplete#enable_at_startup = 1
" NERDTreeのキーマップ@Yggdroot/indentLine
nnoremap <silent><C-e>    :NERDTreeToggle<CR>

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
tnoremap <silent> <ESC>    <C-\><C-n>

"" 全体設定
" 行番号を表示
set number
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
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
" 不可視文字を可視化(<Tab>が「▸-」と表示される)
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

"" 括弧入力で中に移動
inoremap ()    ()<Left>
inoremap {}    {}<Left>
inoremap []    []<Left>
inoremap <>    <><Left>
inoremap ''    ''<Left>
inoremap ""    ""<Left>
inoremap ``    ``<Left>

" 最低限
filetype plugin indent on
syntax enable
