#!/usr/bin/env bash
# shellcheck shell=bash

gclean_merged() { git branch --merged | egrep -v "(^\*|main|master)" | xargs -r git branch -d; }
gco_last() { git checkout @{-1}; }
s