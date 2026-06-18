# ~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~
export EDITOR=nvim
export VISUAL=nvim
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

export SCRIPTS="$HOME/scripts"
export FOUNDRY="$HOME/.foundry/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export HOMEBREW_PREFIX="/opt/homebrew"

# ~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~

# executables
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

# needed for completions + pure prompt
fpath=(
    $HOMEBREW_PREFIX/share/zsh/site-functions
    $HOMEBREW_PREFIX/share/zsh-completions
    $fpath
)

# ~~~~~~~~~~~ Aliases ~~~~~~~~~~~

alias ls="eza --color=always --long --git --no-filesize --all --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias s="source ~/dotfiles/zsh/.zshrc"
alias c="clear"
alias v="nvim"
alias t="tmux"
alias o="opencode"

# ~~~~~~~~~~~ Completion ~~~~~~~~~~~

# Enable interactive completion menu selection
# zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# only refresh dump after 24hrs
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
    compinit -C
else
    compinit
fi

# ~~~~~~~~~~~ Sourcing and Plugins ~~~~~~~~~~~

# fzf
source <(fzf --zsh)

# fzf completions
source ~/fzf-tab/fzf-tab.plugin.zsh

# mise (maybe remove shims if causing issues)
eval "$($HOMEBREW_PREFIX/bin/mise activate zsh --shims)"

# atuin
zvm_after_init_commands+=(
    'eval "$(atuin init zsh)"'
)

# vim mode
source $HOMEBREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# pure prompt
source ~/dotfiles/zsh/zsh/prompt.zsh

# autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# colour syntax highlights
eval "$(/opt/homebrew/bin/zsh-patina activate)"
