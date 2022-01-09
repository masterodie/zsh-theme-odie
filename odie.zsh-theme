ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[yellow]%} ["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

function _echo() {
  # echo without trailing newline
  echo -n "$1"
}

function _separator() {
  separator=${1:-" "}
  _echo "${separator}"
}

function _user() {
  # echo the user name in red if the user is root or green for everyone else
  user="%n"
  if [[ $UID == 0 ]]; then
    user="%{$fg[red]%}${user}%{$reset_color%}"
  else
    user="%{$fg[green]%}${user}%{$reset_color%}"
  fi
  _echo "${user}"
}

function _host() {
  # echo hostname
  host="%m"
  host="%{$fg[cyan]%}${host}%{$reset_color%}"
  _echo "${host}"
}

function _user_at_host() {
  _user
  _separator "@"
  _host
}

function _directory() {
  # echo current working directory
  directory="%1~"
  directory="%{$fg[yellow]%}${directory}%{$reset_color%}"
  _echo "${directory}"
}

function _exit_status() {
  # echo a symbol in red or green depending on the exit status of the last run command
  exit_status="▸"
  exit_status="%(0?.%{$fg[green]%}.%{$fg[red]%})$exit_status%{$reset_color%}"
  _echo "${exit_status}"
}

function _build_prompt() {
  _user_at_host
  _separator
  _directory
  _separator
  _exit_status
  _separator
}

function _git_branch() {
  # echo git branch info
  _echo '$(git_prompt_info)'
}

function _git_status() {
  # echo git branch info
  _echo '$(git_prompt_status) '
}

function _virtualenv() {
  # echo python virtualenv info
  _echo '$(virtualenv_prompt_info)'
}

function _vi_mode() {
  # echo vi mode info
  _echo '$(vi_mode_prompt_info)'
}

function _build_rprompt() {
  _git_status
  _git_branch
  _virtualenv
  _vi_mode
}

PROMPT="$(_build_prompt)"
RPROMPT="$(_build_rprompt)"

# vim: ft=sh
