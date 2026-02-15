# ------------------------------
# Minimal "Starship-like" PS1 (bash)
# - Two-line prompt: ╭╴ ... \n ╰─ λ
# - Shows user@host, truncated path, git branch + status
# - Colors: user red, root green, host yellow, path cyan, git green, lambda blue/red
# ------------------------------

# Colors (ANSI)
C_RESET='\[\e[0m\]'
C_DIM='\[\e[38;5;238m\]'
C_WHITE='\[\e[97m\]'
C_RED_BOLD='\[\e[1;31m\]'
C_GREEN_BOLD='\[\e[1;32m\]'
C_YELLOW_BOLD='\[\e[1;33m\]'
C_CYAN_BOLD='\[\e[1;36m\]'
C_BLUE_BOLD='\[\e[1;34m\]'
C_ERR_BOLD='\[\e[1;31m\]'
C_GIT='\[\e[1;32m\]'

# Username alias (customize)
prompt_username() {
    echo "$USER"
}

# Truncate path to last N segments, show ~ for home
prompt_path() {
  local max_segments=3
  local p="${PWD/#$HOME/~}"

  # Split by /
  IFS='/' read -r -a parts <<< "${p#/}"
  local count="${#parts[@]}"

  if (( count <= max_segments )); then
    echo "$p"
    return
  fi

  local start=$((count - max_segments))
  local tail=("${parts[@]:$start:$max_segments}")

  # Rebuild with leading indicator
  if [[ "$p" == "~"* ]]; then
    echo "…/${tail[*]// /\/}"
  else
    echo "…/${tail[*]// /\/}"
  fi
}

# Git branch + status:
prompt_git() {
  # Not a git repo → show nothing
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch dirty

  # Get current branch (or short commit if detached)
  branch="$(git branch --show-current 2>/dev/null)"
  [[ -z "$branch" ]] && branch="$(git rev-parse --short HEAD 2>/dev/null)"

  # Detect if there are any changes (staged, modified, untracked)
  if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
    dirty="*"
  else
    dirty=""
  fi

  if [[ -n "$dirty" ]]; then
  	echo -e "via  ${branch} \e[31m(*)\e[0m"
	else
		echo "via  ${branch}"
  fi
}

# Read-only indicator (lock) when directory is not writable
prompt_lock() {
  [[ -w "$PWD" ]] && return
  echo " "
}

# Build PS1
__set_ps1() {
  local user_color="$C_RED_BOLD"
  [[ "$EUID" -eq 0 ]] && user_color="$C_GREEN_BOLD"

  local user="$(prompt_username)"
  local host="\h"
  local path="$(prompt_path)"
  local lock="$(prompt_lock)"
  local git="$(prompt_git)"

  # Last command status for lambda color
  local lambda_color="$C_BLUE_BOLD"
  [[ "$1" -ne 0 ]] && lambda_color="$C_ERR_BOLD"

  # First line: ╭╴ OS (fixed linux), user on host at path [lock] git...
  # Note: OS symbol is just "🐧" to avoid relying on Nerd icons in SSH
  PS1="${C_DIM}╭╴${C_WHITE}🐧 ${user_color}${user}${C_RESET} ${C_YELLOW_BOLD}on ${host}${C_RESET} ${C_CYAN_BOLD}at ${path}${C_RESET}${C_DIM}${lock}${C_RESET}"
  if [[ -n "$git" ]]; then
    PS1+=" ${C_GIT}${git}${C_RESET}"
  fi

  # Second line: ╰─ λ
  PS1+="\n${C_DIM}╰─${lambda_color}λ${C_RESET} "
}

# Update PS1 before each prompt
PROMPT_COMMAND='echo; __set_ps1 $?'
