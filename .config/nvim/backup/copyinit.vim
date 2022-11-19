"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/kuon/.cache/dein/repos/github.com/Shougo/dein.vim

  " Required:
  call dein#begin('/home/kuon/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kuon/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  "if dein#check_install()
  "  call dein#install()
  "endif

  "End dein Scripts-------------------------



"インシデント可視化
set list

set listchars=tab:>>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"エンコーディング
set encoding=utf-8
scriptencoding utf-8


"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>


"help日本語化
set helplang=ja


"行番号を表示
set number


"自動でかっこ等を閉じる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
