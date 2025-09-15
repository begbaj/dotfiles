#===============================
# ZSH Style and Funcionalities
#===============================

# Function to shorten path if it's too long
# Shorten long paths: each path component -> first 3 chars if whole display > 40
short_pwd() {
  local -i maxlen=40
  local display rest prefix

  # Use ~ for home
  if [[ $PWD == $HOME* ]]; then
    rest=${PWD#$HOME}        # path after $HOME (may start with / or be empty)
    display="~${rest}"
  else
    display=$PWD
  fi

  # if short enough, just print it
  if (( ${#display} <= maxlen )); then
    print -r -- "$display"
    return
  fi

  # prepare prefix and rest without leading slash or ~
  prefix=""
  if [[ $display == '~'* ]]; then
    prefix="~/"
    rest=${display#\~}
  elif [[ $display == /* ]]; then
    prefix="/"
    rest=${display#/}
  else
    rest=$display
  fi

  # split into parts, shorten each to first 3 chars safely, then join
  local -a parts shortparts
  parts=(${(s:/:)rest})
  for part in "${parts[@]}"; do
    if [[ -z $part ]]; then
      shortparts+=('')
    else
      shortparts+=("$(printf '%.3s' "$part")")
    fi
  done

  print -r -- "${prefix}${(j:/:)shortparts}"
}

# Load vcs_info
autoload -Uz vcs_info

# Git settings
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
zstyle ':vcs_info:git:*' actionformats '%F{red}(%b|%a)%f'

# Run before prompt
precmd() { vcs_info }

# Ensure prompt expands at runtime
setopt PROMPT_SUBST

# Prompt definition
PROMPT='%F{green}%n@%m%f %F{blue}$(short_pwd)%f ${vcs_info_msg_0_} %F{yellow} > %f'

# Enable completion system
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Menu selection (arrow keys to scroll)
zstyle ':completion:*' menu select

# Better descriptions for options
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Group results
zstyle ':completion:*' group-name ''

# Nice colors for completion menu
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Show completion list automatically if multiple matches
setopt AUTO_MENU


