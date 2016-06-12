" =============================================================================
"      FileName: base_config.vim
"          Desc: 
"      HomePage: 
" =============================================================================
set nocompatible              " be iMproved, required
set backspace=indent,eol,start  " make that backspace key work the way it should
filetype off                  " required

filetype plugin indent on    " required

"echo 'gui:' has("gui_running") 'term:' &t_Co+0
set t_Co=256 
set mouse=c       											        " no mouse to command line mode ====
set hlsearch    											        " highlight for search 

set dictionary+=~/.dictionary,~/.mail_aliases   " Dictionary
set backupdir=~/.vim/backup,/tmp                " set backup dir
set tags+=./tags;/                              " Upward tag search
set printoptions+=syntax:y                      " Use syntax hilighting when printing

set grepprg=grep\ -nH\ $*                       " program used for :grep command
set shellslash
set autoindent
set showmatch                   " automatically show matching brackets. works like it does in bbedit.

set ruler                       " show the cursor position all the time
set ts=2
set sw=2
set expandtab
set showcmd
set wildmenu
set lazyredraw
set foldmethod=indent
set foldenable
let mapleader=","

syntax on

filetype plugin on
filetype indent on

" disable errorbells
set vb " visualbell
highlight Search ctermbg=darkgrey

autocmd BufNewFile,BufRead *.tsv set filetype=tsv

autocmd FileType tsv setlocal listchars=tab:<-
autocmd FileType tsv setlocal list

autocmd FileType jade setlocal noexpandtab
autocmd FileType vue setlocal noexpandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType coffee setlocal noexpandtab
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal ts=4
autocmd FileType python setlocal sw=4
autocmd FileType python setlocal nolist

"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff
      autocmd BufNewFile,BufRead README set filetype=markdown

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

      autocmd Syntax gitcommit setlocal textwidth=74
endif " has("autocmd")
