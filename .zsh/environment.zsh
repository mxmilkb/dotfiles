# environment.zsh: Sets up a working shell environment.
# P.C. Shyamshankar <sykora@lucentbeing.com>

# https://github.com/paulmars/huffshell

# Various Paths
# typeset -U path
# path=(~/bin $path /usr/local/bin /var/lib/gems/1.8/bin $HOME/.gem/ruby/1.9.1/bin:/home/milk/.cabal/bin) - should be set in /etc/profile
# path=(~/bin $path) 
# export PATH

typeset -U fpath
fpath=($Z/functions $Z/zsh-completions/src $fpath)

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}

# Important applications.
export EDITOR=vim
export VISUAL=vim

export PAGER="/usr/bin/less -RFX"

export BROWSER="chromium-continuous-bin"

# History Settings
export SAVEHIST=50000
export HISTSIZE=50000
export HISTFILE=~/.zsh_history

# Zsh Reporting
export REPORTTIME=10

export TMPDIR=/var/tmp


C=$(tput colors)
eval $(dircolors -p | sed -e 's/DIR 01;34/DIR 01;36/' | dircolors /dev/stdin)

# sans / so deleting words doesn't delete a full path
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
