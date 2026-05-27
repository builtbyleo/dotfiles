# ~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~

export EDITOR=nvim
export VISUAL=nvim
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

export SCRIPTS="$HOME/scripts"

export FOUNDRY="$HOME/.foundry/bin"

export XDG_CACHE_HOME="$HOME/.cache"

# ~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~

path=(
  $path
  $FOUNDRY
  $XDG_CACHE_HOME
  $HOME/bin
  $HOME/.local/bin
  $SCRIPTS
)

# Remove duplicates + non-existent dirs
typeset -U path
path=($^path(N-/))

export PATH

# ~~~~~~~~~~~ Aliases ~~~~~~~~~~~

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias s="source ~/dotfiles/zsh/.zshrc"
alias cd="z"
alias c="clear"
alias v="nvim"
alias t="tmux"
alias o="opencode"

# ~~~~~~~~~~~ Command Line Editing ~~~~~~~~~~~

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ~~~~~~~~~~~ Completion ~~~~~~~~~~~

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# ~~~~~~~~~~~ Sourcing and Plugins ~~~~~~~~~~~

# autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# vim mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# colour syntax highlights
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# mise
eval "$(/opt/homebrew/bin/mise activate zsh)"

# atuin
eval "$(atuin init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"
