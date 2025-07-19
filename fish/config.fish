alias c="clear"
alias h="history"
alias gpg-agent-restart="gpg-connect-agent reloadagent /bye"
alias start-dev="machinectl start dev"
alias shell-dev="machinectl shell --setenv=\"TERM=xterm-256color\" brad@dev"
alias off-dev="machinectl poweroff dev"

if status is-interactive
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    set -gx EDITOR nvim
    set -gx ALTERNATE_EDITOR nano
    set -gx VISUAL nvim

    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

    clear
end

set -gx PAGER less
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes
set -gx PERL5LIB $HOME/cpan/lib/perl5

if test -d $HOME/bin
    fish_add_path -p $HOME/bin
end

if test -d $HOME/local/bin
    fish_add_path -p $HOME/local/bin
end

if test -d $HOME/local/go/bin
    fish_add_path -p $HOME/local/go/bin
end

if test -d $HOME/go
    set -gx GOPATH $HOME/go
end

if test -d $HOME/go/bin
    fish_add_path -p $HOME/go/bin
end

if test -d $HOME/local/rust/bin
    fish_add_path -p $HOME/local/rust/bin
end

if test -d $HOME/cpan/bin
    fish_add_path -p $HOME/cpan/bin
end

if test -f $HOME/.config/fish/env.fish
    source $HOME/.config/fish/env.fish
end
