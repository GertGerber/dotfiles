#!/usr/bin/env bash
# shellcheck shell=bash

gpt() { command -v openai >/dev/null 2>&1 && openai "$@"; }
