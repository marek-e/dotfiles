# Dotfiles

Personal dotfiles configuration for macOS development environment.

## Overview

This repository contains configuration files for various tools and applications used in my development workflow. All configurations are managed using [GNU Stow](https://www.gnu.org/software/stow/) for easy symlink management.

## What's Included

### Shell Configuration

- **`.zshrc`** - Zsh configuration with Oh My Zsh, Powerlevel10k, and custom aliases
- **`.p10k.zsh`** - Powerlevel10k prompt configuration

### Git Configuration

- **`.gitconfig`** - Git configuration with aliases, colors, and delta integration
- **`.gitignore`** - Global gitignore patterns

### Fish Shell

- **`.config/fish/`** - Complete Fish shell configuration
  - `config.fish` - Main Fish configuration with paths, aliases, and tool integrations
  - `conf.d/fnm.fish` - Fast Node Manager (fnm) integration
  - `fish_variables` - Fish universal variables

### Sketchybar

- **`.config/sketchybar/`** - macOS status bar configuration
  - `sketchybarrc` - Main configuration file
  - `colors.sh` - Color scheme definitions
  - `icons.sh` - SF Symbols icon definitions
  - `items/` - Status bar item configurations
  - `plugins/` - Status bar plugin scripts

### Starship

- **`.config/starship.toml`** - Cross-shell prompt configuration

## Prerequisites

Before setting up these dotfiles, ensure you have the following installed:

- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install GNU Stow

```bash
brew install stow
```

### 3. Install Dependencies

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install other tools
brew install eza dust ouch fnm starship fish
```

### 4. Deploy Configuration

```bash
# Deploy all configurations (will adopt existing files)
stow -t ~ . --adopt

# Or deploy specific packages
stow -t ~ .zshrc
stow -t ~ .p10k.zsh
stow -t ~ .gitconfig
stow -t ~ .config
```

## Key Features

### Shell Aliases

- `l`, `ll`, `la`, `lt` - Enhanced `ls` commands using `eza`
- `c` - Open current directory in VS Code
- `cr` - Open current directory in Cursor
- `du` - Disk usage with `dust`
- `comp`/`decomp` - Compression utilities with `ouch`

### Git Configuration

- Delta for enhanced diffs
- Useful aliases (`gco`, `gcb`, `gcm`, `gst`, etc.)
- Automatic rebase on pull
- Autosquash and autostash enabled

### Node.js Management

- Fast Node Manager (fnm) for Node.js version management
- Automatic Node version switching on directory change

### Fish Shell Features

- Modern shell with syntax highlighting
- Git abbreviations
- Tool integrations (starship, direnv, zoxide)
- pnpm and Bun support

### Sketchybar Setup

- Custom macOS status bar
- System monitoring (CPU, battery, volume)
- Media controls
- Window management integration

## Adding New Configurations

To add new configuration files:

1. Add the file to this repository
2. Run `stow -t ~ .` to create symlinks
3. Commit the changes

Example:

```bash
# Add a new config file
echo "some config" > ~/dotfiles/.vimrc
git add .vimrc
git commit -m "Add vim configuration"

# Deploy it
stow -t ~ .
```

## Updating Configurations

To update existing configurations:

1. Edit the files in this repository
2. Changes are automatically reflected in your system (via symlinks)
3. Commit the changes

## Troubleshooting

### Stow Conflicts

If you encounter conflicts when running stow:

```bash
# Use --adopt to move existing files into the repo
stow -t ~ . --adopt

# Or remove conflicting files first
rm ~/.conflicting-file
stow -t ~ .
```

### Broken Symlinks

If symlinks become broken:

```bash
# Remove all stow symlinks
stow -D -t ~ .

# Recreate them
stow -t ~ .
```

### Fish Shell Issues

If Fish shell isn't working properly:

```bash
# Reinstall Fish configuration
stow -D -t ~ .config
stow -t ~ .config
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [GNU Stow](https://www.gnu.org/software/stow/) for dotfile management
- [Oh My Zsh](https://ohmyz.sh/) for Zsh framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for the prompt theme
- [Sketchybar](https://github.com/FelixKratz/SketchyBar) for the status bar
- [Fish Shell](https://fishshell.com/) for the modern shell experience
