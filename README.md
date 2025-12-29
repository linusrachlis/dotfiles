# Dotfiles git repo

The approach here is based on this article:
https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d

## New machine setup

1. Install [Homebrew](https://brew.sh/)
2. Install [oh-my-zsh](https://ohmyz.sh/#install)
3. Install Homebrew packages:
```sh
brew install git neovim fzf fnm lazygit
```
4. Set up dotfiles repo
```sh
git clone --bare git@github.com:linusrachlis/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```
