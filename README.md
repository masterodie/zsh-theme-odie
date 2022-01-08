# ZSH Theme

This theme includes status indicators for git, python virtualenv, vi mode and a symbol indicating the exit status of the last run command.

This was built with the help of [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

## Screenshots

The terminal used in the screenshots is gnome-terminal

The Colorscheme used is [vimix-dark-laptop-doder](https://github.com/vinceliuice)

Last command successful
![clean](screenshots/clean.png)

Last command error
![command status](screenshots/command_status.png)

Git branch info
![git clean](screenshots/git_clean.png)

Python virtalenv info
![virtualenv clean](screenshots/venv_clean.png)

Python virtalenv info and git with changes in repository
![virtualenv and dirty git](screenshots/venv_git_dirty.png)

Vi-mode normal mode indicator
![vi-mode](screenshots/vi_mode.png)

## Installation

### antigen

With [antigen](https://github.com/zsh-users/antigen) add

```zsh
# load antigen
source ${HOME}/.zsh/antigen.zsh
#...
antigen use oh-my-zsh
# ...
antigen bundle git
antigen bundle virtualenv
antigen bundle vi-mode
# ...
antigen theme masterodie/zsh-theme-odie
# ...
antigen apply
# ...
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true  # needed for vi-mode indicator to work correctly
```
