alias c="clear"
alias h="history"

if status is-interactive
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    set -gx EDITOR nvim
    set -gx ALTERNATE_EDITOR nano
    set -gx VISUAL nvim

    keychain --eval --agents ssh id_ed25519 | source
    
    clear
end

set -gx PAGER less
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes

if test -d $HOME/bin
    fish_add_path -p $HOME/bin
end

if test -d $HOME/local/bin
    fish_add_path -p $HOME/local/bin
end

if test -d $HOME/.local/bin
    fish_add_path -p $HOME/.local/bin
end

if test -d $HOME/go/bin
    fish_add_path -p $HOME/go/bin
end

if test -f $HOME/.config/fish/env.fish
    source $HOME/.config/fish/env.fish
end
