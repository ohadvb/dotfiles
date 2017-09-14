##### COMPLETION #####

autoload -U compinit
compinit
# completion menu style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

##### ZSH OPTIONS #####

setopt auto_cd
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars
setopt CORRECT CORRECT_ALL
setopt EXTENDED_GLOB
setopt prompt_subst
unsetopt nomatch
setopt histignoredups
setopt auto_pushd
export dirstacksize=5

##### COLORS #####

autoload -U colors
colors

export CLICOLOR=1 # enable colored output from ls, etc
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


##### EDITOR #####

export VISUAL="emacsclient -c"
export EDITOR=$VISUAL

##### BINDINGS #####

bindkey "^R" history-incremental-search-backward
bindkey "^N" insert-last-word
bindkey -s "^T" "^asudo ^e" # "t" for "toughguy"


##### PROMPT #####

# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%2~%{$reset_color%}] '

##### HISTORY #####

export HISTSIZE=4096
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

##### COMMAND EDITING #####

export WORDCHARS='*?[]~&;!$%^<>'

##### EXTENTIONS #####

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
