#! bash oh-my-bash.module

# Axin Bash Prompt, inspired by themes from other frameworks.
# (Attachment-provided content)
# shellcheck shell=bash

# Color setup
if [[ "$TERM" = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color; fi
if tput setaf 1 >/dev/null 2>&1; then
  tput sgr0
  bold=$(tput bold)          reset=$(tput sgr0)
  black=$(tput setaf 0)      red=$(tput setaf 1)
  green=$(tput setaf 2)      yellow=$(tput setaf 3)
  blue=$(tput setaf 4)       magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)       white=$(tput setaf 7)
else
  bold='' reset='' black='' red='' green='' yellow='' blue='' magenta='' cyan='' white=''
fi

# Git branch helper
function _omb_theme_git_branch {
  command git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Exit code indicator
function _omb_theme_status {
  local ec=$?
  [[ $ec -eq 0 ]] && echo "${green}✔${reset}" || echo "${red}✘${reset}"
}

# Host and user
function _omb_theme_host_user {
  printf "%s@%s" "$USER" "$HOSTNAME"
}

# Working dir
function _omb_theme_cwd {
  printf "%s" "${PWD/#$HOME/~}"
}

# Prompt components
PS1="\[$bold\]\$(_omb_theme_status) \[$cyan\]\$(_omb_theme_host_user) \[$yellow\]\$(_omb_theme_git_branch)\[$reset\] \[$blue\]\$(_omb_theme_cwd)\[$reset\]\n$ "
