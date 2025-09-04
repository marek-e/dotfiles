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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(fnm env --use-on-cd --shell zsh)"

#eval "$(starship init zsh)"

alias decomp='ouch decompress'
alias comp='ouch compress'
alias setup-git='~/Documents/git-setup.sh'
alias c='code .'
alias cr='cursor .'
alias du='dust'

alias l='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lg='eza --long --git --icons --group-directories-first --color=auto'
alias la='eza --long --git --icons --all --group-directories-first --color=auto'
alias lt='eza --long --git --icons --tree --level=2 --group-directories-first --color=auto'

PATH=~/.console-ninja/.bin:$PATH