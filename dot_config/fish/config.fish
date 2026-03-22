set -g fish_greeting

fish_add_path --path --move --prepend \
    /opt/homebrew/bin \
    $HOME/.local/bin \
    /opt/homebrew/opt/postgresql@16/bin \
    $HOME/.ghcup/bin \
    $HOME/.cabal/bin \
    $HOME/.atuin/bin

if type -q fzf
    fzf --fish | source
end

if type -q zoxide
    zoxide init fish --cmd cd | source
end

if type -q atuin
    atuin init fish | source
end

if type -q starship
    starship init fish | source
end

if type -q thefuck
    env TF_SHELL=fish thefuck --alias | source
end

if test -f "$HOME/.openclaw/completions/openclaw.fish"
    source "$HOME/.openclaw/completions/openclaw.fish"
end

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
