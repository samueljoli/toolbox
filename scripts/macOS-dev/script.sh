#!/bin/sh

log () {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

# OS architecture
UNAME_MACHINE="$(uname -m)"

# Install Homebrew if not already installed
if ! command -v brew >/dev/null; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    log "Adding Homebrew to PATH"

    if [[ "${UNAME_MACHINE}" == "arm64" ]]
    then
	    # On ARM macOS, homebrew installs to /opt/homebrew only
	    eval "$(/opt/homebrew/bin/brew shellenv)"
    else
	    # On Intel macOS, homebrew installs to /usr/local/only
	    eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# May not need this
if brew list | grep -Fq brew-cask; then
    log "Uninstalling old Homebrew-Cask ..."
    brew uninstall --force brew-cask
fi

log "Updating Homebrew formulae"

# brew update --force

# Begin installing dependencies

if ! command -v git; then
     log "Installing Git"
     brew install git
fi

if ! command -v openssl; then
     log "Installing openssl"
     brew install openssl
fi

if ! command -v chezmoi; then
     log "Installing chezmoi"
     brew install chezmoi

     log "Pulling down dotfiles from Github..."
     sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply Samueljoli
fi

if ! command -v docker; then
     log "Installing docker for mac"
     brew install docker
fi

if ! command -v terraform; then
     log "Installing terraform"
     brew tap hashicorp/tap; brew install hashicorp/tap/terraform
fi

# databases
if ! command -v postgres; then
     log "Installing postgres"
     brew install postgres
fi

# languages
if ! command -v node; then
    log "Installing NVM & Node"
    export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    # Relies on nvm being added to PATH which is handled on dotfile install
    nvm install --lts
fi

# toys
if ! command -v bat; then
     log "Installing Bat"
     brew install bat
fi

if ! command -v ag; then
     log "Installing the_silver_searcher"
     brew install the_silver_searcher
fi

if ! command -v kitty; then
     log "Installing Kitty"
     curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if open -Ra "Raycast" ; then
    log "Raycast is installed on this maching. Skipping step"
else
     log "Installing Raycast"
     brew install --cask raycast
fi

# Install last as this ends script execution
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
    log "Setting up oh my zsh"

    log "download gruvbox iterm colors"
    curl --remote-name https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors

    log "download gruvbox oh my zsh theme"
    curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


log "Saving post install document to Desktop"

curl --remote-name https://raw.githubusercontent.com/samueljoli/toolbox/main/scripts/macOS-dev/post_install.txt

mv ./post_install.txt ~/Desktop
