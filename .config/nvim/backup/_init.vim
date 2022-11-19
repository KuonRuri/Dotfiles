"dein Scripts-----------------------------
"
"プラグインがダウンロードされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

"dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible               " Be iMproved
endif

  " Required:
set runtimepath+=/home/kuon/.cache/dein/repos/github.com/Shougo/dein.vim

"設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "プラグインリストを収めたTOMLファイル
  let g:rc_dir    = expand('~/.config/nvim/')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  "TOMLを読み込み、キャッシュする
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  "設定完了
  call dein#end()
  call dein#save_state()
endif

"もし未インストールがあればインストール
if dein#check_install()
  call dein#install()
endif

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
inoremap <silent> っj <Esc>

"help日本語化
set helplang=ja

"行番号を表示
set number

"自動でかっこ等を閉じる
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
""inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

"TABの空白文字数変更
set tabstop=4
set shiftwidth=4

"WSLでwindowsからペーストできるようにする
"let g:clipboard = {
"	'name': 'myClipboard',
"	'copy': {
"		'+': 'win32yank.exe -i',
"		'*': 'win32yank.exe -i',
"		},
"	'paste': {
"		'+': 'win32yank.exe -o',
"		'*': 'win32yank.exe -o',
"		},
"	'cache_enabled': 1,
"	}
