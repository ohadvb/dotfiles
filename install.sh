#!/bin/bash

# Check if Vim-Plug is installed, and install it if not
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing Vim-Plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "Vim-Plug is already installed."
fi

# Function to check if Homebrew is installed
is_homebrew_installed() {
  if command -v brew &> /dev/null; then
    return 0
  else
    return 1
  fi
}

# Check if Homebrew is installed
if is_homebrew_installed; then
  echo "Homebrew is detected. Installing Node.js using Homebrew..."
  brew install node
else
  echo "Homebrew is not detected. Installing Node.js using install-node.vercel.app..."
  curl -sL install-node.vercel.app/lts | bash
fi


# Check and install pyright for CoC if not installed
if ! command -v pyright &> /dev/null; then
    echo "Installing pyright (required for CoC)..."
    npm install -g pyright
else
    echo "pyright is already installed."
fi

# Check and install clangd for CoC if not installed
if ! command -v clangd &> /dev/null; then
    echo "Installing clangd (required for CoC)..."
    sudo apt-get install -y clangd
else
    echo "clangd is already installed."
fi

# Run PlugInstall to install Vim-Plug plugins
vim -c "PlugInstall" -c "qa"

echo "Installation and PlugInstall completed."

