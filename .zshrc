export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

export PATH="/usr/local/bin:/usr/bin:/sbin:/home/lili/.local/bin:$PATH"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  history-substring-search
  colored-man-pages
  command-not-found
)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' rehash true
autoload -Uz compinit && compinit -u

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

alias shutdown='shutdown -h +5'
alias zed='zeditor'
alias gparted='gksu gparted'
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"
alias ls='exa --icons'
alias l='exa --icons -lh'
alias ll='exa --icons -lah'
alias la='exa --icons -A'
alias lm='exa --icons -m'
alias lr='exa --icons -R'
alias lg='exa --icons -l --group-directories-first'
alias htop=bpytop

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=245'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[function]='fg=green'
ZSH_HIGHLIGHT_STYLES[default]='fg=white'

export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=37;41:sg=30;43:tw=30;42:ow=34;42"

SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  git
  line_sep
  char
  python
)


SPACESHIP_USER_SHOW="always"
SPACESHIP_PYTHON_COLOR="yellow"
SPACESHIP_PYTHON_SYMBOL=" "
SPACESHIP_PYTHON_SHOW="true"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_FORMAT="%T"


for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  plugin_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin"
  [[ ! -d "$plugin_path" ]] && git clone https://github.com/zsh-users/$plugin.git "$plugin_path"
done

# Created by `pipx` on 2025-08-20 11:48:01
export PATH="$PATH:/home/lili/.local/bin"
