# general stuff

function _echo() {
  # echo without trailing newline
  str=$1
  echo -n "${str}"
}

function _colorize() {
  # echo a string with a color
  str=$1
  color=${2:-default}
  _echo "%{${fg[${color}]}%}${prefix}${str}${suffix}%{${reset_color}%}"
}

# left prompt

function _user() {
  # echo the user name in red if the user is root or green for everyone else
  user="%n"
  if [[ $UID == 0 ]]; then
    color="red"
  else
    color="green"
  fi
  _colorize "${user}" "${color}"
}

function _host() {
  # echo hostname
  host="%m "
  color="cyan"
  _colorize "${host}" "${color}"
}

function _user_at_host() {
  _user
  _colorize "@"
  _host
}

function _directory() {
  # echo current working directory
  directory="%1~ "
  color="yellow"
  _colorize "${directory}" "${color}"
}

function _exit_status() {
  # echo a symbol in red or green depending on the exit status of the last run command
  exit_status=" "
  exit_status="%(0?.%{$fg[green]%}.%{$fg[red]%})$exit_status%{$reset_color%}"
  _echo "${exit_status}"
}

function _build_prompt() {
  _user_at_host
  _directory
  _exit_status
}

# right prompt

function _git_branch() {
  # echo git branch info
  color="green"
  _colorize ' $(git_prompt_info)' "${color}"
}

function _git_status() {
  # echo git branch info
  _echo ' $(git_prompt_status)'
}

function _virtualenv() {
  # echo python virtualenv info
  _colorize ' $(virtualenv_prompt_info)' "yellow"
}

function _vi_mode() {
  # echo vi mode info
  _echo ' $(vi_mode_prompt_info)'
}

function _build_rprompt() {
  _git_status
  _git_branch
  _virtualenv
  _vi_mode
}

# build prompt

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="$(_colorize " ✚" "green")"
ZSH_THEME_GIT_PROMPT_MODIFIED="$(_colorize " ✹" "blue")"
ZSH_THEME_GIT_PROMPT_DELETED="$(_colorize " ✖" "red")"
ZSH_THEME_GIT_PROMPT_RENAMED="$(_colorize " ➜" "magenta")"
ZSH_THEME_GIT_PROMPT_UNMERGED="$(_colorize " ═" "yellow")"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$(_colorize " ✭" "cyan")"

ZSH_THEME_VIRTUALENV_PREFIX="["
ZSH_THEME_VIRTUALENV_SUFFIX="]"

PROMPT="$(_build_prompt)"
RPROMPT="$(_build_rprompt)"

# vim: ft=sh
