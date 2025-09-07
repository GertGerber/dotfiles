#!/usr/bin/env bash
# shellcheck shell=bash

kctx() { kubectl config use-context "$1"; }
kns() { kubectl config set-context --current --namespace "$1"; }
