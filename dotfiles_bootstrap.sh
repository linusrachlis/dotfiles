###
## Run this after cloning or pulling dotfiles repo. It should be idempotent.
###

##
# Tmux - clone TPM and catppuccin theme
##
TMUX_TPM_PATH=~/.tmux/plugins/tpm
if [ -d $TMUX_TPM_PATH ]; then
    echo "TPM already installed (directory exists: $TMUX_TPM_PATH)"
else
    echo "Installing TPM"
    git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_PATH
fi

# This theme is breaking window names for some reason
# TMUX_CATP_PATH=~/.config/tmux/plugins/catppuccin/tmux
# if [ -d $TMUX_CATP_PATH ]; then
#     echo "Tmux catppuccin already installed (directory exists: $TMUX_CATP_PATH)"
# else
#     echo "Installing Tmux catppuccin"
#     git clone -b v2.1.2 https://github.com/catppuccin/tmux.git $TMUX_CATP_PATH
# fi
