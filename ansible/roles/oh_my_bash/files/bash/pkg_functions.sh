#!/usr/bin/env bash
# shellcheck shell=bash

pkg_install() {
  if command -v apt >/dev/null 2>&1; then sudo apt-get install -y "$@"
  elif command -v dnf >/dev/null 2>&1; then sudo dnf install -y "$@"
  elif command -v pacman >/dev/null 2>&1; then sudo pacman -S --noconfirm "$@"
  elif command -v zypper >/dev/null 2>&1; then sudo zypper --non-interactive in "$@"
  fi
}
