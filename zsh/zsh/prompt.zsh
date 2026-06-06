# pure prompt
autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=10

# Prompt symbol (❯)
zstyle ':prompt:pure:prompt:*' color magenta

# Current path
zstyle :prompt:pure:path color blue

# Git branch name
zstyle :prompt:pure:git:branch color red

# Git dirty marker (*)
zstyle :prompt:pure:git:dirty color red

# Git arrows (⇡ ⇣)
zstyle :prompt:pure:git:arrow color red

# Git stash symbol (≡)
zstyle :prompt:pure:git:stash color red

# Optional: git actions (rebase, cherry-pick, etc.)
zstyle :prompt:pure:git:action color red

# Show virtualenv / conda environment
zstyle :prompt:pure:environment:virtualenv show yes

prompt pure
