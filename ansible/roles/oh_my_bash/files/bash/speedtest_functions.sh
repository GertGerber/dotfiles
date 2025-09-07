#!/usr/bin/env bash
# shellcheck shell=bash

speedtest_csv() { command -v speedtest >/dev/null 2>&1 && speedtest --format=tsv; }
