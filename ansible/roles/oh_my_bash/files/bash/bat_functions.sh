#!/usr/bin/env bash
# shellcheck shell=bash

# View files with bat with sensible defaults
batn() { bat --style=numbers --paging=never "$@"; }
bats() { bat --style=plain --paging=never "$@"; }
batp() { bat --style=plain "$@"; }
