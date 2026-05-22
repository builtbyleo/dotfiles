#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TPM_DIR="$HOME/.tmux/plugins/tpm"

log() {
	printf '\n==> %s\n' "$*"
}

ensure_command_line_tools() {
	[[ "$(uname -s)" == "Darwin" ]] || return
	xcode-select -p >/dev/null 2>&1 && return

	log "Installing Xcode Command Line Tools"
	xcode-select --install
	printf 'Re-run %s after the installer finishes.\n' "$0"
	exit 1
}

install_homebrew() {
	command -v brew >/dev/null 2>&1 && return

	log "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

load_homebrew() {
	eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_brew_bundle() {
	log "Installing Homebrew bundle"
	brew bundle --file "$DOTFILES_DIR/Brewfile"
}

install_mise_toolchains() {
	log "Installing mise toolchains"
	brew install mise
	eval "$(mise activate bash)"

	mise use --global --yes \
		rust@latest \
		node@lts \
		python@latest \
		go@latest
}

install_foundry() {
	log "Installing Foundry"

    local foundry_dir="${FOUNDRY_DIR:-$HOME/.foundry}"
	local foundry_bin_dir="$foundry_dir/bin"

	if [[ ! -x "$foundry_bin_dir/foundryup" ]]; then
		curl -fsSL https://foundry.paradigm.xyz | bash
	fi

	foundryup
}

stow_dotfiles() {
	log "Stowing dotfiles"
	stow -t ~ */
}

install_tmux_plugins() {
	log "Installing tmux plugins"

	if [[ ! -d "$TPM_DIR/.git" ]]; then
		git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
	fi

	"$TPM_DIR/bin/install_plugins"

	tmux source-file "$DOTFILES_DIR/tmux/.config/tmux/tmux.conf"
}

main() {
	ensure_command_line_tools
	install_homebrew
	load_homebrew
	install_brew_bundle
	install_mise_toolchains
	install_foundry
	stow_dotfiles
	install_tmux_plugins

	log "Bootstrap complete"
}

main "$@"
