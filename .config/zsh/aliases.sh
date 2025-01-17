alias reload_aliases='. ~/.config/zsh/aliases.sh'
alias edit_aliases='nvim ~/.config/zsh/aliases.sh'

alias showpath='echo $PATH | tr : ''\\n'''

rename_master_to_main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

dotfiles_git_on() {
    export GIT_WORKS_WITH_DOTFILES_REPO=1
}
git() {
    if [ $GIT_WORKS_WITH_DOTFILES_REPO -eq 1 ]; then
        command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
    else
        command git $@
    fi
}
dotfiles_git_off() {
    export GIT_WORKS_WITH_DOTFILES_REPO=0
}
dotfiles_git_off # Initialize variable to 0

watch() {
    while true; do; clear; $@; sleep 1; done
}
watch-slow() {
    while true; do; clear; $@; sleep 10; done
}

# Always use Nvim rather than vi or vim
alias vi=nvim
alias vim=nvim
# Nvim easy session resume
alias nvims='nvim -S Session.vim'

if [ -f ~/.config/zsh/aliases_extra ]; then
    source ~/.config/zsh/aliases_extra
fi
