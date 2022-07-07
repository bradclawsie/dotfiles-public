# perl
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes
set -gx GROKLOC_REPO $HOME/repos/grokloc-perl5
set -gx GROKLOC_LIB_INC $GROKLOC_REPO/lib
set -gx GROKLOC_SERVICE_INC $GROKLOC_REPO/service/app/lib
set -gx GROKLOC_INCS $GROKLOC_LIB_INC:$GROKLOC_SERVICE_INC
set -gx PERL5LIB $GROKLOC_INCS:$HOME/perl5/lib/perl5

# paths
set -gx PATH $HOME/bin:$HOME/perl5/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH

alias c clear
alias h history

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
    set -gx ALTERNATE_EDITOR emacs
    set -gx VISUAL emacsclient

    # gnupg
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    clear;
end
