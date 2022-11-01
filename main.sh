#!/usr/bin/env bash
set -e

printf "Setting up the new machine!"

sudo -v

softwareupdate --install-rosetta

cd -P "$(dirname "${BASH_SOURCE}")"

if ! command -v brew > /dev/null 2>&1; then
  # Get Homebrew installed if not present
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
fi
  brew update
  brew upgrade
  brew bundle
# Create Coding folders
mkdir -p ~/Code/Projects
mkdir -p ~/Code/Learning

printf "\nUpdating macOS\n"
# sudo softwareupdate -i -a

if [[ "$(xcode-select -p)" == "" ]]; then
  printf "\nInstalling Xcode\n"
  xcode-select --install
fi

printf "Installing Volta"
curl https://get.volta.sh | bash
volta install node@lts

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

