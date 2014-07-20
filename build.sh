#!/usr/bin/env bash

exec docker build -t xforty/rails-base "$(dirname "$0")"
