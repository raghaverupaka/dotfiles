#
# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias conflicts='git diff --name-only --diff-filter=U'

if [ -f /opt/dev/dev.sh ]; then
  source /opt/dev/dev.sh
elif [ -f ~/src/github.com/burke/minidev/dev.sh ]; then
  source ~/src/github.com/burke/minidev/dev.sh
fi

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:${PATH}"

export HISTFILE="$HOME/.zhistory"

# Borrowed from https://github.com/rafaelfranca/dotfiles/blob/master/dotfiles/zshrc
export HISTSIZE=50000
export SAVEHIST=10000
export HISTTIMEFORMAT="[%F %T] "
setopt inc_append_history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export PURE_GIT_UNTRACKED_DIRTY=0

EDITOR="nvim"
export EDITOR="$EDITOR"
alias vi="$EDITOR"

echo "Reminder: use 'bt' in pry to print filtered backtrace."
echo "Reminder: $(cat /etc/spin/secrets/shop-beta-reminder)"
echo "Reminder: $(cat /etc/spin/secrets/c1-order-session)"
