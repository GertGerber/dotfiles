#!/usr/bin/env bash
# shellcheck shell=bash

# Loaded last on macOS
brew_or_fail() { command -v brew >/dev/null 2>&1 || echo "Homebrew not installed"; }
