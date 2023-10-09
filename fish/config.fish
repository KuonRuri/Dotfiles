if status is-interactive
    # Commands to run in interactive sessions can go here
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

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
