# Dotfiles git repo

The approach here is based on this article:
https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d

## Bootstrap script

**After** cloning or pulling dotfiles, (re-)run `dotfiles_bootstrap.sh`. It
should be idempotent.

Its reason for existence so far is to install Tmux's TPM plugin, for which the
procedure is a git clone. I don't want to mess with submodules and I don't want
to just statically version all the TPM source files, _and_ I don't want to end
up with various bespoke setup steps for dotfiles stuff.
