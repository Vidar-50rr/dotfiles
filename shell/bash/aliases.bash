# Aliases

alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# Safer defaults (optional)
if command -v dircolors >/dev/null 2>&1; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# bat on Debian/Ubuntu
if command -v batcat >/dev/null 2>&1 && ! command -v bat >/dev/null 2>&1; then
  alias bat='batcat'
fi
