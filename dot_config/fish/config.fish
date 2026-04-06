
fish_add_path --path --move --prepend \
    /opt/homebrew/bin \
    $HOME/.local/bin \
    /opt/homebrew/opt/postgresql@16/bin \
    $HOME/.ghcup/bin \
    $HOME/.cabal/bin \
    $HOME/.atuin/bin

fzf --fish | source
zoxide init fish --cmd cd | source

function cd --wraps=__zoxide_z --description 'zoxide-backed cd with fallback notice'
    __sayori_cd $argv
end

atuin init fish --disable-up-arrow | source
starship init fish | source
env TF_SHELL=fish thefuck --alias | source
source "$HOME/.openclaw/completions/openclaw.fish"

# 保留 Fish 默认 Up/Down 语义，只把 Ctrl+Up 交给 Atuin。
bind ctrl-up _atuin_bind_up
bind -M insert ctrl-up _atuin_bind_up

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
