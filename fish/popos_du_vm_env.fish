set -gx CGO_ENABLED 1
if test -d $HOME/.local/share/mise/shims
    fish_add_path -p $HOME/.local/share/mise/shims
end
eval "$(mise activate fish)"
