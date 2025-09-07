#!/usr/bin/env bash
# shellcheck shell=bash

arch_pkg_count() { pacman -Q | wc -l; }
