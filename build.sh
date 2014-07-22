#!/usr/bin/env bash

exec docker build --no-cache -t xforty/rails-base "$(dirname "$0")"
