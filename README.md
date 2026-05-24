
# Dotfiles

Personal config files, no guarantees this will work on your machine (or even mine). Managed with GNU stow <3 

## Fresh Install

From a clean machine:

```sh
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

`bootstrap.sh` will install Homebrew if needed, run the `Brewfile`, install languages via mise, stow the dotfiles into `$HOME`, and install tmux plugins.

## Layout

- `bootstrap.sh`: main setup script for a new machine.
- Each top-level directory is a Stow package, like `zsh`, `nvim`, `tmux`, or `git`.
- Package contents mirror where they should live under `$HOME`, for example `nvim/.config/nvim` becomes `~/.config/nvim`.

## Stow Commands

Run these from the repo root.

Stow one package:

```sh
stow -t "$HOME" zsh
```

Stow all packages:

```sh
stow -t "$HOME" */
```

