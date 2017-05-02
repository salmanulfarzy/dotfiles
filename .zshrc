export ZSH=$HOME/.oh-my-zsh
source "$HOME/.aliases"
source "$HOME/.functions"

# homebrew options
HOMEBREW_NO_AUTO_UPDATE="true"

# zsh variables
unsetopt correct        # disable auto correct
unsetopt correct_all
ZSH_THEME="spaceship"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# space ship theme options
# SPACESHIP_PROMPT_SYMBOL="❯"
SPACESHIP_EXIT_STATUS_SHOW="false"

# zsh options
setopt HIST_IGNORE_SPACE
unsetopt correct_all
unsetopt correct

# List of plugins
plugins=(k z alias-tips zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)

export GOPATH="$HOME/.go"

export PATH="$HOME/.go/bin:$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/usr/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
