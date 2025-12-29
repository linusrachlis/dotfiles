# This is sourced before $ZSH/oh-my-zsh.sh

eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy=recursive)"

plugins=(
    git
    fzf
)
