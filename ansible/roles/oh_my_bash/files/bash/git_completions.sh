#!/usr/bin/env bash
# shellcheck shell=bash
# If git-completion is present, source it (path may vary by distro)
for p in /usr/share/bash-completion/completions/git /etc/bash_completion.d/git; do
  [ -r "$p" ] && . "$p"
done
