set -gx CGO_ENABLED 1

if test -d $HOME/local/go/bin
    fish_add_path -p $HOME/local/go/bin
end

if test -d $HOME/local/dmd2/linux/bin64
    fish_add_path -p $HOME/local/dmd2/linux/bin64
end

. ~/perl5/perlbrew/etc/perlbrew.fish
