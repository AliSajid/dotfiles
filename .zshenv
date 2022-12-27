source "$HOME/.cargo/env"
if [ -e /Users/asimami/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/asimami/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias assume="source assume"

fpath=(/Users/asimami/.granted/zsh_autocomplete/assume/ $fpath)

fpath=(/Users/asimami/.granted/zsh_autocomplete/granted/ $fpath)
