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

ZSH_THEME_NODEENV_PREFIX="%{$fg[green]%} ["
ZSH_THEME_NODEENV_SUFFIX="]%{$reset_color%}"

SEPARATOR='::'
USER=

function _user() {
  if [[ $UID == 0 ]]; then
    name="%{$fg[red]%}%n%{$reset_color%}"
  else
    name="%{$fg[green]%}%n%{$reset_color%}"
  fi
  if [[ -n $name ]]; then
    echo -n "$name"
  fi
}

function _host() {
  hostname="%{$fg[cyan]%}%m%{$reset_color%}"
  if [[ -n $hostname ]]; then
    echo -n "$hostname"
  fi
}

function _directory() {
  directory="%1~"
  echo -n "%{$fg[yellow]%}$directory%{$reset_color%}"
}

function _end() {
  symbol="▸"
  end="%(0?.%{$fg[green]%}.%{$fg[red]%})$symbol%{$reset_color%}"
  echo -n " $end "
}

function _prompt() {
  _user
  echo -n "@"
  _host
  echo -n " "
  _directory
  _end
}

function _build_prompt() {
  RETVAL=$?
  _prompt
}

function _git_branch() {
  echo -n '$(git_prompt_info)'
}

function _git_status() {
  echo -n '$(git_prompt_status) '
}

function _virtualenv() {
if type "virtualenv_prompt_info" > /dev/null
then
    echo -n '$(virtualenv_prompt_info)'
fi
}

function _direnv_virtualenv() {
  if [[ -z $VIRTUAL_ENV ]]
  then
    echo -n '$(basename $VIRTUAL_ENV)'
  fi
}

function _nodeenv() {
if type "nodeenv_prompt_info" > /dev/null
then
    echo -n '$(nodeenv_prompt_info)'
fi
}

function _mode() {
  echo -n '$(vi_mode_prompt_info)'
}

function _build_rprompt() {
  RETVAL=$?
  _git_status
  _git_branch
  _virtualenv
  _direnv_virtualenv
  _nodeenv
  _mode
}

PROMPT="$(_build_prompt)"
RPROMPT="$(_build_rprompt)"

# vim: ft=sh
