alias c="clear"
alias h="history"
alias gpg-agent-restart="gpg-connect-agent reloadagent /bye"
alias glhut="hut --config=$HOME/.grokloc/.config/hut/config"
alias format-patch="git format-patch --subject-prefix="PATCH" -o ~/patches HEAD^"

if status is-interactive
    # locale
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    # history
    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    # default editor
    set -gx EDITOR emacsclient
    set -gx ALTERNATE_EDITOR nano
    set -gx VISUAL emacsclient

    # gnupg
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    clear
end

# pager
set -gx PAGER bat

# grokloc-related
set -gx REPOSITORY_BASE /tmp
set -gx POSTGRES_APP_URL postgres://grokloc:grokloc@localhost:5432/app

# perl vars
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes

fish_add_path -p $HOME/bin

# ui
starship init fish | source
