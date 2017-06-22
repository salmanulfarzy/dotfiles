export ZSH=$HOME/.oh-my-zsh
source "$HOME/.aliases"
source "$HOME/.functions"

# homebrew options
HOMEBREW_NO_AUTO_UPDATE=1

# zsh variables
unsetopt correct        # disable auto correct
unsetopt correct_all
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# zsh options
setopt HIST_IGNORE_SPACE
unsetopt correct_all
unsetopt correct

export EDITOR='vim'

ZSH_THEME="spaceship"
SPACESHIP_NODE_SYMBOL="⬢ "

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/repos
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export GOPATH="$HOME/.go"
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# List of plugins
plugins=(k z alias-tips zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)

export PATH="$HOME/.go/bin:$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/usr/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


source "/home/sfarzy/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
