

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
export ZWIFT_SRC_HOME="$HOME/code"
export PROJECT_ROOT="$ZWIFT_SRC_HOME/docker-sandbox"
export JAVA_HOME=$(/usr/libexec/java_home)
. "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias gs="git status"

export PATH="$HOME/.cargo/bin:$PATH"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
#PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

#GEORGES
#
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/Users/gmathews/.zshrc'
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
alias ls='ls -G'
alias grep='grep --color=always'
export GREP_COLOR='1;37;47'
# Use vim
export EDITOR=vim
export VISUAL=vim
# Nice prompt
autoload -U promptinit; promptinit
prompt pure
# Search current history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

EMOJI=(💩 🚀 🐞 🍕 👽 ☕️ 💀 🐷 🐼 🐶 🐸 🍔 🍣 🍻 💰 💎 🍪 🌞 🐓 🍄 )

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

PROMPT='$(random_emoji) '
