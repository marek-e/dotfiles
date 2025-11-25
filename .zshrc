# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(
      git
      colored-man-pages
      z
      docker
      docker-compose
      macos
      aws
      brew
      command-not-found
      npm
      colorize
      dotnet
      eza
      zoxide
      fnm
      fzf
      gh
      mise
      nmap
      ssh
    )

source $ZSH/oh-my-zsh.sh

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicate commands
setopt HIST_FIND_NO_DUPS     # Don't show duplicates in search
setopt SHARE_HISTORY         # Share history between sessions

# Zsh Options
setopt AUTO_CD              # Type directory name to cd into it
setopt CORRECT              # Suggest corrections for typos
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt NO_BEEP             # Disable beep sounds

# Completion Options
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colorful completion menus

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(fnm env --use-on-cd --shell zsh)"

#eval "$(starship init zsh)"

# =============================================================================
# ALIASES
# =============================================================================

# File Operations
alias decomp='ouch decompress'
alias comp='ouch compress'
alias setup-git='~/Documents/git-setup.sh'
alias c='code .'
alias cr='cursor .'
alias du='dust'

# Eza (ls replacement)
alias l='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --grid'
alias lg='eza --long --git --icons --group-directories-first --color=auto'
alias la='eza --long --git --icons --all --group-directories-first --color=auto'
alias lt='eza --long --git --icons --tree --level=2 --group-directories-first --color=auto'

# Package Managers
alias pn='pnpm'
alias b='brew'
alias ba='brew install'
alias bu='brew update && brew upgrade && brew cleanup'

# =============================================================================
# FUNCTIONS
# =============================================================================

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick backup of files
backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.zip)     unzip "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================

# Default Editor
#export EDITOR='code --wait'
#export VISUAL='code'

# Better less options
export LESS='-R -F -X -i -M -w'

# Enable color support
export CLICOLOR=1

# =============================================================================
# PATH MANAGEMENT
# =============================================================================

export PATH="$HOME/.console-ninja/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# =============================================================================
# TOOL INITIALIZATION
# =============================================================================

#eval "$(mise activate zsh)"
