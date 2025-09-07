#!/usr/bin/env bash
# shellcheck shell=bash

# Simple task runner delegating to Taskfile if present
task() {
  if command -v task >/dev/null 2>&1; then command task "$@"; else echo "task: Taskfile not installed"; return 127; fi
}
