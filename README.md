#How to use

Run *./setup.sh* to install the plugins

# Included Plugins

* **auto-pairs** : 자동으로 괄호 짝을 맞춰줌
* **vim-surround** : 요상한 단축키로 단어에 따옴표 / 괄호 씌우기 - http://www.vim.org/scripts/script.php?script_id=1697
* **nerdcommenter** : "\ + c + c" to comment & uncomment
* **vim-snipmate** : inc(tab) => #include <stdio.h>, mainn(tab) => int main()... (vim-snippets에 auto-completion 리스트가 있음)
* **syntastic** : when you save -> show errors
* **neocomplete** : pops up auto-completion menu -> ctrl+j to select
* **vim-Tagbar** : \t to view file's tag  
* ...and many more.

# Syntax Files - Many are unused as of now.  

* **vim-rails** : has_many 등등의 Rails 예약어 highlighting
* **vim-ruby** : Ruby
* Check .vimrc for possible usage

# Dependencies
* **tlib_vim** : Snipmate에 필요
* **vim-addon-mw-utils** : Snipmate에 필요
* **vim-snippets** : Snipmate에서 사용하는 snippets파일들

# Notable .vimrc settings.

* **map Space to \** : press space where leader key is required
* **&#8203;*&#8203;** in visual mode to search currently selected part.
* **Ctrl -hjkl** : move between splits easily
* **:W** : write a file as sudo.
* **\l** : view currently open buffers  
* ...and many more.
