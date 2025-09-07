#!/usr/bin/env bash
# shellcheck shell=bash

tf() { terraform "$@"; }
tfa() { terraform apply "$@"; }
tfd() { terraform destroy "$@"; }
