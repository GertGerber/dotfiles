#!/usr/bin/env bash
# shellcheck shell=bash

command -v kwctl >/dev/null 2>&1 && source <(kwctl completion bash)
