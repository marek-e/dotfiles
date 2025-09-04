# ~/.config/fish/config.fish

# 0) Quiet the greeting
set -g fish_greeting

# 1) Homebrew paths (Apple Silicon & Intel)
if test -d /opt/homebrew/bin
    fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin
end
if test -d /usr/local/bin
    fish_add_path -g /usr/local/bin /usr/local/sbin
end

# 2) Locale (helps with Unicode in tools)
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# 3) Editor (tweak to taste)
set -gx EDITOR "code -w"
set -gx VISUAL $EDITOR

# 4) JS/TS toolchains — Bun & pnpm
# Bun
if test -d $HOME/.bun/bin
    fish_add_path -m $HOME/.bun/bin
end

# pnpm (Corepack creates this; adjust if different)
set -Ux PNPM_HOME $HOME/.local/share/pnpm
if test -d $PNPM_HOME
    fish_add_path -m $PNPM_HOME
end

# 5) Node version management (prefer mise, then fnm, then asdf)
if type -q mise
    mise activate fish | source
else if type -q fnm
    fnm env --use-on-cd | source
else if type -q asdf
    source (asdf dir)/asdf.fish
end

# 6) Optional quality-of-life if installed
if type -q starship
    starship init fish | source
end
if type -q direnv
    direnv hook fish | source
end
if type -q zoxide
    zoxide init fish | source
end

# 7) Git abbreviations
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gcm 'git commit -m'
abbr -a gst 'git status -sb'
abbr -a gd 'git diff'
abbr -a gp 'git push'
abbr -a gl 'git pull --rebase --autostash'

# 8) JS/TS abbreviations
abbr -a pi  'pnpm install'
abbr -a pr  'pnpm run'
abbr -a px  'pnpm dlx'
abbr -a btest 'bun test'

#  modern replacement abbreviations
abbr -a l 'eza'
abbr -a ll 'eza --long --git --icons --group-directories-first --color=auto'
abbr -a la 'eza --long --git --icons --all --group-directories-first --color=auto'
abbr -a lt 'eza --long --git --icons --tree --level=2 --group-directories-first --color=auto'
abbr -a c 'code .'
abbr -a cr 'cursor .'
abbr -a du 'dust'

abbr -a decomp 'ouch decompress'
abbr -a comp 'ouch compress'


# 9) Pager defaults
set -gx PAGER less
set -gx LESS '-R --use-color -F -X -M'

# 10) Clean tab/window titles
function fish_title
    echo (prompt_pwd)
end

# 11) Ghostty manual shell integration (preserves features if you switch shells)
if set -q GHOSTTY_RESOURCES_DIR
    set -l ghostty_fish "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    if test -f $ghostty_fish
        source $ghostty_fish
    end
end
