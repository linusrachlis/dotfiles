# vim:fileencoding=utf-8:foldmethod=marker

# Git and dotfiles helpers {{{

rename_master_to_main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

gitdotfiles() {
    export GIT_DIR=$HOME/.dotfiles/
    export GIT_WORK_TREE=$HOME
}

gitnodotfiles() {
    unset GIT_DIR
    unset GIT_WORK_TREE
}

# }}}

# General shortcuts and helpers {{{

watch() {
    while true; do; clear; eval $@; sleep 1; done
}
watch-slow() {
    while true; do; clear; eval $@; sleep 5; done
}

alias reload_aliases='. ~/.config/zsh/aliases.sh'
alias edit_aliases='nvim ~/.config/zsh/aliases.sh'

alias lg=lazygit
# Always use Nvim rather than vi or vim
alias vi=nvim
alias vim=nvim
# Nvim easy session resume
alias nvims='nvim -S Session.vim'
alias showpath='echo $PATH | tr : ''\\n'''
# Easy kitty command sending
alias k='kitty @'

# }}}

# Include work-only aliases if exists
if [ -f ~/.config/zsh/work_aliases.sh ]; then
    source ~/.config/zsh/work_aliases.sh
fi
