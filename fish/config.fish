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

fish_add_path -p $HOME/bin
fish_add_path -p $HOME/go/bin

if test -f ~/.config/fish/env.fish
    source ~/.config/fish/env.fish
end
