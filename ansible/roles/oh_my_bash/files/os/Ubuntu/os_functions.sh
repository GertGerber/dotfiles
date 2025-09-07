#!/usr/bin/env bash
# shellcheck shell=bash

is_wsl() { grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null; }
