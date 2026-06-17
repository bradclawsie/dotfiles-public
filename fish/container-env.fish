set -gx CGO_ENABLED 1

source "$HOME/.cargo/env.fish"

if test -d $HOME/local/perl5
    fish_add_path -p $HOME/local/perl5/bin
end
