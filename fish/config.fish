# system paths
set -gx PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# alias
alias c="clear"
alias h="history"
alias gpg-agent-restart="gpg-connect-agent reloadagent /bye"
alias glhut="hut --config=$HOME/.grokloc/.config/hut/config"

if status is-interactive
    # locale
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    # history
    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    # default editor
    set -gx EDITOR nvim
    set -gx ALTERNATE_EDITOR nvim
    set -gx VISUAL nvim

    # gnupg
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    clear
end

# local bin
set -gx PATH $HOME/bin $PATH

# pager
set -gx PAGER bat

# go
set -gx PATH $HOME/go/bin $PATH

# cargo/rust
set -gx PATH $HOME/.cargo/bin $PATH

# grokloc-related
set -gx REPOSITORY_BASE /tmp
set -gx POSTGRES_APP_URL postgres://grokloc:grokloc@localhost:5432/app

# ui
starship init fish | source
