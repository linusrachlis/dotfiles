# Dotfiles git repo

The approach here is based on this article:
https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d

## Bootstrap script

**After** cloning or pulling dotfiles, (re-)run `dotfiles_bootstrap.sh`. It
should be idempotent.

It doesn't actually do anything right now, I used to need it for Tmux setup.
