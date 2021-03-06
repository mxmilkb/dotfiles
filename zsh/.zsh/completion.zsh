# completion.zsh: Directives for the Z-Shell completion system.
# Original: P.C. Shyamshankar <sykora@lucentbeing.com>
# Changes: Milk Brewster
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html

# -U avoids expanding aliases, -z for zsh not ksh(?), then init all completion _files in $fpath
# autoload -Uz compinit && compinit
autoload -z compinit && compinit

# Support both short completions and longer completions with info
zstyle ':completion:*' verbose yes

# zstyle ':completion:*' menu select
zstyle ':completion:*' menu select=0 search

# order files by modification time
zstyle ':completion:*' file-sort modification

# Complete with same colors as ls.
zstyle ':completion:*' list-colors "${LS_COLORS}"

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _expand _complete _correct _approximate # Completion modifiers.
# _files
zstyle ':completion:*:match:*' original only
zstyle ':completion:*' max-errors 1 # Be lenient to 1 errors.

# And if you want the number of errors allowed by _approximate to increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# Ignore the current directory in completions
zstyle ':completion:*' ignore-parents pwd

# Auto rehash commands
# http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion:*' rehash true

# Use a completion cache
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $Z/cache/$HOST

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# Sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# message when there are no completions
# zstyle ':completion:*:warnings' format 'no results'

zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
# completion displays directories first
# zstyle ':completion:*' list-dirs-first true

# For enabling autocompletion of privileged environments in privileged commands
zstyle ':completion::complete:*' gain-privileges 1

# alias k="kill"
# zstyle ':completion:*:*:*:*:processes' command 'ps -ef --no-headers -w -w'
# zstyle ':fzf-tab:complete:k:argument-rest' extra-opts \
#   --preview=$extract';ps --pid=$in[(w)2] uww' --preview-window='down:15%:wrap'
