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

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/repos
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

export NVM_LAZY_LOAD=true

# List of plugins
plugins=(k z zsh-nvm alias-tips zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)
fpath=($HOME/.zfunctions $fpath)

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/usr/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(user host dir git venv exec_time line_sep char)
