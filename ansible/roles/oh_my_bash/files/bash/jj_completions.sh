#!/usr/bin/env bash
# shellcheck shell=bash

# jj completion if available
command -v jj >/dev/null 2>&1 && source <(jj util completion bash)
