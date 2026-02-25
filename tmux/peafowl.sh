#!/usr/bin/env bash
# Inspred by https://github.com/peafowl/tmux

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux source "${PLUGIN_DIR}/peafowl_options.tmux"
tmux source "${PLUGIN_DIR}/peafowl.tmux"
