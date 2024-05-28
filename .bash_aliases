alias reload-aliases='. ~/.bash_aliases'
alias edit-aliases='nvim ~/.bash_aliases'

alias showpath='echo $PATH | tr : ''\\n'''

rename-master-to-main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}
