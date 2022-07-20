" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Vi 互換なし
if &compatible
    set nocompatible               " Be iMproved
endif

" ファイルタイプに応じた自動インデント
filetype plugin indent on

" Character encoding Setting  ref="http://www.tooyama.org/vim-2.html"
set encoding=utf-8
set fileencodings=utf-8

" http://www.crimson-snow.net/tips/unix/vim.html
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使う
set expandtab

"自動インデント
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" インデント折りたたみ系
set foldmethod=indent
set nofoldenable

" 行番号表示
set number

" カーソル行をハイライトしない (シンタックスハイライトが遅くなる
set nocursorline
" カーソル行を強調表示
"set cursorline
" カーソルが何行目の何列目に置かれているかを表示する。
set ruler

" 色，シンタックスハイライト設定
set background=dark
syntax on

" コマンド補完設定
set wildmenu
"set wildmode=list:longest,full
set wildmode=longest:full,full

" マウスホイール
set mouse=a
set ttymouse=xterm2


" ステータスライン設定
set laststatus=2 "常に表示

" 検索結果をハイライト表示する
set hlsearch

" jk で見た目通りに移動
"nmap j gj
"nmap k gk

" DやCにならったヤンク
"nnoremap Y y$

" Esc の2回押しでハイライト消去
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

set belloff=all
