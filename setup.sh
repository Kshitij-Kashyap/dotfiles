#!/bin/bash

# Neovim NvChad Setup Script
# This script symlinks the nvim directory to ~/.config/nvim and checks for dependencies.

DOTFILES_NVIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/nvim"
CONFIG_NVIM_DIR="$HOME/.config/nvim"

echo "Setting up Neovim configuration..."

# Check for dependencies
echo "Checking dependencies..."
for cmd in nvim git rg gcc make; do
    if ! command -v $cmd &> /dev/null; then
        echo "Warning: $cmd is not installed. Please install it for the best experience."
    fi
done

# Create ~/.config if it doesn't exist
mkdir -p "$HOME/.config"

# Handle existing nvim config
if [ -d "$CONFIG_NVIM_DIR" ]; then
    if [ -L "$CONFIG_NVIM_DIR" ]; then
        echo "Current nvim config is already a symlink. Removing it..."
        rm "$CONFIG_NVIM_DIR"
    else
        echo "Backing up existing nvim config to ~/.config/nvim_backup_$(date +%Y%m%d_%H%M%S)..."
        mv "$CONFIG_NVIM_DIR" "$CONFIG_NVIM_DIR_backup_$(date +%Y%m%d_%H%M%S)"
    fi
fi

# Symlink the nvim directory
echo "Symlinking $DOTFILES_NVIM_DIR to $CONFIG_NVIM_DIR..."
ln -s "$DOTFILES_NVIM_DIR" "$CONFIG_NVIM_DIR"

echo "Setup complete! Launch 'nvim' to finish plugin installation."
