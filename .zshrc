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
SPACESHIP_PROMPT_SYMBOL="❯"

# zsh options
setopt HIST_IGNORE_SPACE
unsetopt correct_all
unsetopt correct

# List of plugins
plugins=(k z alias-tips zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$HOME/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/bin:/usr/sbin:$PATH"
export MANPATH="/usr/local/man:/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

