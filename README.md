# dotfiles
*Daniel Saul*

Mixture of dotfiles for MacOS, Debian, Arch etc

### Cloning dotfiles
    alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    echo ".cfg" >> .gitignore
    git clone --bare <git-repo-url> $HOME/.cfg
    dotcfg checkout

Use `dotcfg` instead of git to control the repository.

### General
* Neovim with vim-plug
* ZSH with OhMyZSH

### MacOS Specific
* KWM
* KHD
* Karabiner
* Hyper
