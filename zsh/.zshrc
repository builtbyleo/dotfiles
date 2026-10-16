# ~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~
export EDITOR=nvim
export VISUAL=nvim
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

export SCRIPTS="$HOME/scripts"
export FOUNDRY="$HOME/.foundry/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export HOMEBREW_PREFIX="/opt/homebrew"

# ~~~~~~~~~~~ History + Options ~~~~~~~~~~~

HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups hist_ignore_space share_history extended_history
setopt interactive_comments no_beep

# ~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~

# executables
path=(
    $HOME/.local/share/mise/shims
    $HOMEBREW_PREFIX/opt/ffmpeg-full/bin
    $HOMEBREW_PREFIX/bin
    $HOMEBREW_PREFIX/sbin
    $path
    $FOUNDRY
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
    $HOME/.zsh/completions
    $HOMEBREW_PREFIX/share/zsh/site-functions
    $HOMEBREW_PREFIX/share/zsh-completions
    $fpath
)

# ~~~~~~~~~~~ Aliases ~~~~~~~~~~~

alias ls="eza --color=auto --long --git --no-filesize --all --icons=auto --no-time --no-user --no-permissions --group-directories-first"
alias gl="git log --oneline --color=always | fzf --ansi --preview 'git show --color=always {1}'"
alias s="exec zsh"
alias c="clear"
alias v="nvim"
alias t="tmux"

# ~~~~~~~~~~~ Completion ~~~~~~~~~~~

# Enable interactive completion menu selection
# zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=always $realpath'

# use the cached dump unless a completion dir changed since it was written
# (e.g. brew install / gen-completions added a file), then rebuild it
autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
_stale_fpath=($^fpath(N-/e:'[[ $REPLY -nt $_zcompdump ]]':))
if [[ -f $_zcompdump ]] && (( ! $#_stale_fpath )); then
    compinit -C -d $_zcompdump
else
    rm -f $_zcompdump
    compinit -d $_zcompdump
fi
unset _zcompdump _stale_fpath

# ~~~~~~~~~~~ Sourcing and Plugins ~~~~~~~~~~~

# fzf
source <(fzf --zsh)

# fzf completions
source ~/fzf-tab/fzf-tab.plugin.zsh

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
eval "$($HOMEBREW_PREFIX/bin/zsh-patina activate)"
