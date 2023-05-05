if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr ls 'ls -al'
abbr ga 'git add . && git commit && git rev-parse --abbrev-ref HEAD | xargs git push origin'
abbr gaa 'git add .'
abbr gc 'git commit'
abbr gp 'git rev-parse --abbrev-ref HEAD | xargs git push origin'
abbr gs 'git status'
abbr gd 'git diff'
abbr n 'nvim'
abbr mkdir 'mkdir -p'
abbr ps 'ps -A'
abbr cp 'cp -r'
