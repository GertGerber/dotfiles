#!/usr/bin/env bash
# shellcheck shell=bash

path_prepend() { case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH";; esac; export PATH; }
path_append() { case ":$PATH:" in *":$1:"*) ;; *) PATH="$PATH:$1";; esac; export PATH; }
