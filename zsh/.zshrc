# aliases
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias cd="z"
alias c="clear"
alias v="nvim"
alias o="opencode"

export EDITOR=nvim

export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

## cycle through autocomplete menu
autoload -Uz compinit && compinit -C

# QoL plugins

## autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
## vim mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
## colour syntax highlights
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# mise
eval "$(/opt/homebrew/bin/mise activate zsh)"

export PATH="$HOME/.local/bin:$PATH"

# atuin
eval "$(atuin init zsh)"

# zoxide
eval "$(zoxide init zsh)"


# starship
eval "$(starship init zsh)"
