alias reload-aliases='. ~/.config/zsh/aliases.sh'
alias edit-aliases='nvim ~/.config/zsh/aliases.sh'

alias showpath='echo $PATH | tr : ''\\n'''

rename-master-to-main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

config() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

if [ -f ~/.config/zsh/aliases_extra ]; then
    source ~/.config/zsh/aliases_extra
fi
