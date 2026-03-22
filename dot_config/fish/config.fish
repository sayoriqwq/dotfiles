set -g fish_greeting

fish_add_path --path --move --prepend \
    /opt/homebrew/bin \
    $HOME/.local/bin \
    /opt/homebrew/opt/postgresql@16/bin \
    $HOME/.ghcup/bin \
    $HOME/.cabal/bin \
    $HOME/.atuin/bin

fzf --fish | source
zoxide init fish --cmd cd | source
atuin init fish | source
starship init fish | source
env TF_SHELL=fish thefuck --alias | source
source "$HOME/.openclaw/completions/openclaw.fish"

alias ls="eza --icons=auto"

function v
    if test (count $argv) -eq 0
        code .
    else
        code $argv
    end
end

function z
    if test (count $argv) -eq 0
        zed .
    else
        zed $argv
    end
end
