if status is-interactive
	if test $TERM = "xterm-kitty"
		exec tmux new-session -A -s main
	end
end

abbr ls 'ls -al'
abbr se 'sudoedit'
abbr ga 'git add . && git commit && git rev-parse --abbrev-ref HEAD | xargs git push origin'
abbr gaa 'git add .'
abbr gc 'git commit'
abbr gs 'git status'
abbr gd 'git diff'
abbr n 'nvim'
abbr mkdir 'mkdir -p'
abbr ps 'ps -A'
abbr cp 'cp -r'
abbr dp 'docker ps'
abbr dr 'docker rm -f'
abbr de 'docker exec'
abbr ds 'docker run'
abbr dt 'docker stop'
abbr cpc 'g++ main.cpp -std=c++14 -I /usr/include/ac-library -g -fsanitize=undefined,address -D_GLIBCXX_DEBUG'
abbr ot 'g++ main.cpp -std=c++14 -I /usr/include/ac-library -g -fsanitize=undefined,address -D_GLIBCXX_DEBUG && oj t'
abbr ac 'acc s -s -- -y'

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

