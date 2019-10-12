echo -ne "\033]6;1;bg;red;brightness;23\a"
echo -ne "\033]6;1;bg;green;brightness;25\a"
echo -ne "\033]6;1;bg;blue;brightness;25\a"

ZSH=~/.oh-my-zsh
ZSH_THEME="geometry-modified"
ZSH_CUSTOM=~/.ohmyzsh/

HISTCONTROL=ignoredups:ignorespace

alias sudo='sudo '

plugins=(git mosh pip archlinux zsh-iterm-touchbar zsh-completions zsh-autosuggestions)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# ZSH Vi Mode
bindkey -v
export KEYTIMEOUT=1

# vi to open neovim
alias vi=nvim

# l for longform ls
alias l='ls -lh'

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Color listing
eval $(gdircolors ~/.dir_colors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Virtualenv activate
activate() {
  source ./$1/bin/activate
}

# creates a directory and cds into it
mkd() {
	mkdir -p "$@" && cd "$@"
}

# Dotfiles git -> dotcfg
alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export EDITOR="nvim"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export PATH="/usr/local/opt/llvm/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

export PATH=node_modules/.bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

export PATH="${HOME}/nvim-osx64/bin:$PATH"
