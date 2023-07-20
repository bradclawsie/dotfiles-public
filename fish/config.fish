# system paths
set -gx PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# alias
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

# rakubrew
$HOME/.rakubrew/bin/rakubrew init Fish | source
set -gx PATH $HOME/.rakubrew/bin $PATH
set -gx RAKUBREW_HOME $HOME/.rakubrew

# perl vars
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes
set -gx LOCAL_PERL5 $HOME/perl5/perlbrew/perls/perl-5.38.0
set -gx PERL5LIB $LOCAL_PERL5/lib

# perlbrew, if used
if test -e $HOME/perl5/perlbrew/etc/perlbrew.fish
    source $HOME/perl5/perlbrew/etc/perlbrew.fish
end

# perl paths
set -gx PATH /usr/bin/vendor_perl $PATH
set -gx PATH /usr/bin/core_perl $PATH
set -gx PATH $LOCAL_PERL5/bin $PATH
