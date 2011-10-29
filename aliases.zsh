# aliases.zsh: Sets up aliases which make working at the command line easier.
# P.C. Shyamshankar <sykora@lucentbeing.com>

# Colors for ls.
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# Looking around, and moving about.
alias ll='ls -lh'
alias la='ls -lah'

alias ...=../..
alias 'cd..=cd ..'
alias ',,=..'

# Clear
alias 'c=clear'

# Makes parent dir if it doesn't exist
alias 'mkdir=mkdir -p'

# List dir items
alias 'dus=du -ms * | sort -n'

# Graphical tree of subdir files
alias 'lt=tree -d'

# For quick viewing of txt files
alias L=less

# Quick sudo editing of txt files
alias 'sn=sudo nano'

# For running an app in the background without any stdout in console
alias -g S='&> /dev/null &'

# Some application shortcuts.
alias g="grep -EiRn --color=tty"
alias u="uzbl"

# Aptitude
alias 'a=sudo aptitude'
alias 'ai=sudo aptitude install'
alias 'ar=sudo aptitude remove'
alias 'au=sudo aptitude update'
alias 'ag=sudo aptitude safe-upgrade'
alias 'as=apt-cache search'
alias 'aw=apt-cache show'

# Pacman
alias 'pu=sudo pacman -Syu' 
alias 'pS=sudo pacman -Ssyu'
alias 'p=sudo pacman -S'
alias 'pU=sudo pacman -U'

# List ANSI colours
alias 'colours=for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done'

# List open ports
alias 'ports=netstat -plnt'

# Mount with coloum output
alias 'mounts=mount | column -t'

# List connections
alias 'cons=lsof -i'

# Search running processes
alias 'ps?'='ps ax | grep '

# Bastard Oper From Hell excuse
alias bofh='nc bofh.jeffballard.us 666 | tail -n 1'

# Public IP address
alias pip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'

# Git
alias 'ga=git add.'
alias 'gc=git commit -m'
alias 'gp=git push'

# Get shit done - temp redirect certain sites to localhost
alias 'gsd=sudo /home/milk/scripts/get-shit-done/get-shit-done'
