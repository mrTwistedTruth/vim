" mrTwistedTruth vimrc file
" Work in progress but better than downloading someone elses massive vimrc and
" not understanding most of it.



" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy and paste. (test this to see if it is Better)
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a
set bs=2 " test this

" Rebind <leader> key
let mapleader = ","
let maplocalleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key (in python good to have imports
" sorted alphabetically)
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks. Indentation
vnoremap < <gv
vnoremap > >gv

" Show whitespace
" MUST be inserted BEFORE ColorScheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O python.vim http://www.vim.org/scripts/download_script.php?src_id=2538
set t_Co=256
colorscheme distinguished
"colorscheme askapachecode
"colorscheme blackboard

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Show line numbers and length
set number " show line numbers
set tw=79  " width of document ( used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
" If typing one long line and want it to be formatted into no more than 80 char
" lines then go into the text somewhere and type Q
vmap Q gq
nmap Q gqap

" Other usefull settings
set history=700
set undolevels=700

" Real programmers don't use TABS but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" disable the never used backup files: file~
set nobackup

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/folder
call pathogen#infect()

" CUSTOM LINES FOR CODING {{{3
map <silent> <LocalLeader>l1 <Home>A<C-R>=printf('%s%s', printf(&commentstring, ' '), repeat('=', 160))<CR><Home><Esc>
map <silent> <LocalLeader>l2 <Home>A<C-R>=printf('%s%s', printf(&commentstring, ' '), repeat('=', 80))<CR><Home><Esc>
map <silent> <LocalLeader>l3 <Home>A<C-R>=printf('%s%s', printf(&commentstring, ' '), repeat('-', 40))<CR><Home><Esc>
map <silent> <LocalLeader>l4 <Home>A<C-R>=printf('%s%s', printf(&commentstring, ' '), repeat('-', 20))<CR><Home><Esc>

" ================================================================================
" Python IDE Setup
" ================================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for ctrlp
" git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30


" Settings for python-mode
" cd ~/.vim/bundle/
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable



