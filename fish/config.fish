if status is-interactive
	if test $TERM = "xterm-kitty"
		exec tmux new-session -A -s main
	end
end

abbr ls 'eza -al'
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
abbr cpc 'g++-12 -std=gnu++23 -O2 -Wall -Wextra -mtune=native -march=native -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 -lgmpxx -lgmp -I /usr/include/ac-library -g -D_GLIBCXX_DEBUG main.cpp'
abbr ot 'g++-12 -std=gnu++23 -O2 -Wall -Wextra -mtune=native -march=native -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 -lgmpxx -lgmp -I /usr/include/ac-library -g -D_GLIBCXX_DEBUG main.cpp && oj t'
abbr ac 'acc s -s -- --yes --wait=0'
abbr less 'less -R'

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

# pip fish completion start
function __fish_complete_pip
    set -lx COMP_WORDS (commandline -o) ""
    set -lx COMP_CWORD ( \
        math (contains -i -- (commandline -t) $COMP_WORDS)-1 \
    )
    set -lx PIP_AUTO_COMPLETE 1
    string split \  -- (eval $COMP_WORDS[1])
end
complete -fa "(__fish_complete_pip)" -c pip3
# pip fish completion end
