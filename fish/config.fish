# perl
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes
set -gx PERL5LIB $HOME/perl5/lib/perl5

# system paths
set -gx PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# alias
alias c="clear"
alias h="history"
alias gpg-agent-restart="gpg-connect-agent reloadagent /bye"

if status is-interactive
    # locale
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    # history
    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    # default editor
    set -gx EDITOR emacs
    set -gx ALTERNATE_EDITOR helix
    set -gx VISUAL emacs

    # gnupg
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    clear
end

# local bin
set --export PATH $HOME/bin $PATH

# go
set --export PATH $HOME/go/bin $PATH

# cargo/rust
set --export PATH $HOME/.cargo/bin $PATH

# perl
set --export PATH $HOME/perl5/bin $PATH
set --export PATH /usr/bin/vendor_perl $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
