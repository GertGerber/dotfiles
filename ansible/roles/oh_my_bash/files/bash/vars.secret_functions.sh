#!/usr/bin/env bash
# shellcheck shell=bash

# Load secrets if present (not committed)
[ -r "$HOME/.config/bash/vars.secret" ] && . "$HOME/.config/bash/vars.secret"
