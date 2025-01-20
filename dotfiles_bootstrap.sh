###
## Run this after cloning or pulling dotfiles repo. It should be idempotent.
###

##
# Tmux - clone TPM
#
# Note: on initial install via prefix + I, TPM also installs a fresh copy of
# itself at ~/.config/tmux/plugins/tpm/, even though the readme clearly says to
# initially clone it to ~/.tmux/plugins/tpm/. I don't know if this is
# intentional, e.g. the initial clone is just to bootstrap TPM and then the
# other copy is to keep up to date? But it's always the copy in the initial
# clone that is sourced from tmux.conf. Filing under "doesn't matter right
# now."
##
TMUX_TPM_PATH=~/.tmux/plugins/tpm
if [ -d $TMUX_TPM_PATH ]; then
    echo "TPM already installed (directory exists: $TMUX_TPM_PATH)"
else
    echo "Installing TPM"
    git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_PATH
fi
