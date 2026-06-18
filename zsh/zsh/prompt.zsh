autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=10

# Prompt symbol
zstyle ':prompt:pure:prompt:*' color 183

# Current path (Ayu orange)
zstyle ':prompt:pure:path' color 215

# Git branch name
zstyle ':prompt:pure:git:branch' color 210

# Git dirty marker (*)
zstyle ':prompt:pure:git:dirty' color 210

# Git arrows (⇡ ⇣)
zstyle ':prompt:pure:git:arrow' color 210

# Git stash symbol (≡)
zstyle ':prompt:pure:git:stash' color 210

# Git actions (rebase, merge, etc.)
zstyle ':prompt:pure:git:action' color 210

# Virtualenv / conda environment
zstyle ':prompt:pure:environment:virtualenv' show yes

prompt pure
