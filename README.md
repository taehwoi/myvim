#How to use


Run *./setup.sh* to install the plugins

# Included Plugins

1. **auto-pairs** : 자동으로 괄호 짝을 맞춰줌
2. **vim-surround** : 요상한 단축키로 단어에 따옴표 / 괄호 씌우기 - http://www.vim.org/scripts/script.php?script_id=1697
3. **nerdcommenter** : "\ + c + c" to comment & uncomment
4. **vim-snipmate** : inc(tab) => #include <stdio.h>, mainn(tab) => int main()... (vim-snippets에 auto-completion 리스트가 있음)
5. **syntastic** : when you save -> show errors
6. **neocomplete** : pops up auto-completion menu -> ctrl+j to select
7. **vim-Tagbar** : <leader> l to view file's tag
...and many more.

# Syntax Files - Unused as of now.

1. **html5-vim** : HTML5 - HTML과 JavaScript
2. **vim-haml** : HAML
3. **vim-less** : LESS
4. **vim-scala** : Scala
5. **vim-handlebars** : Handlebars
6. **vim-rails** : has_many 등등의 Rails 예약어 highlighting
7. **grunt.vim** : Grunt의 Gruntfile syntax highlighting 및 각종 이상한 기능들
8. **vim-coffee-script** : CoffeeScript
9. **vim-javascript** : JavaScript
10. **vim-ruby** : Ruby

# Dependencies
1. **tlib_vim** : Snipmate에 필요
2. **vim-addon-mw-utils** : Snipmate에 필요
3. **vim-snippets** : Snipmate에서 사용하는 snippets파일들

# Notable .vimrc settings.

1. mapped space key to \ : \w to save, \q to quit, and so on.
2. * in visual mode to search currently selected part.
3. <Ctrl> -hjkl : move between splits easily
4. :W : write a file as sudo.
...and many more.
