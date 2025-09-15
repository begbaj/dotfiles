#===============================
# Aliases
#===============================
alias open="xdg-open"
alias tmux="tmux -u"

alias chedit="chezmoi edit"
alias chez="chezmoi"

alias mv="mv -v"

alias webcampv="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --no-terminal & disown"

alias ll="exa -lgs type"
alias lla="exa -lags type"
alias l="exa -lag"
alias ls="exa"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias docker-up='sudo docker-compose up -d'

alias venv="sh .venv/bin/activate"

# opens a new terminal in the same directory
alias term="alacritty & disown > /dev/null"

# Latex package manager default user mode
alias tlmgr='tlmgr --usermode'

# Put this in ~/.zshrc
alias rm='rm -i'

