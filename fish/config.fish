alias c="clear"
alias h="history"
alias gpg-agent-restart="gpg-connect-agent reloadagent /bye"

if status is-interactive
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    set -gx HISTFILE $HOME/.histfile
    set -gx HISTSIZE 10000
    set -gx SAVEHIST 10000

    set -gx EDITOR helix
    set -gx ALTERNATE_EDITOR nano
    set -gx VISUAL helix

    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null

    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

    clear
end

set -gx PAGER less
set -gx PERL_UNICODE AS
set -gx PERL_READLINE_NOWARN yes

if test -d $HOME/bin
    fish_add_path -p $HOME/bin
end

if test -d $HOME/go/bin
    fish_add_path -p $HOME/go/bin
end

if test -d $HOME/.rustup/toolchains/stable-x86_64-linux-gnu/bin
    fish_add_path -p $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin
end

if test -f $HOME/.config/fish/env.fish
    source $HOME/.config/fish/env.fish
end

if test -f $HOME/perl5/perlbrew/etc/perlbrew.fish
    source $HOME/perl5/perlbrew/etc/perlbrew.fish
end
