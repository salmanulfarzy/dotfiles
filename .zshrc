#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source "$HOME/.aliases"
source "$HOME/.functions"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/repos
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)
fpath=($HOME/.zfunctions $fpath)

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/usr/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export HISTFILE="$HOME/.zsh_history"

