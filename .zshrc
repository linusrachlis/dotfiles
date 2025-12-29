# vim:fileencoding=utf-8:foldmethod=marker

export PATH=$HOME/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"

# Use work config if present (not tracked), otherwise personal
if [ -f ~/.config/zsh/work.sh ]; then
    source ~/.config/zsh/work.sh
else
    source ~/.config/zsh/personal.sh
fi

source $ZSH/oh-my-zsh.sh

if [ -f ~/.config/zsh/managed_blocks.sh ]; then
    source ~/.config/zsh/managed_blocks.sh
fi

if [ -f ~/.config/zsh/aliases.sh ]; then
    source ~/.config/zsh/aliases.sh
fi

export EDITOR=nvim
