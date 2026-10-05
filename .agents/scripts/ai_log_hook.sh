#!/usr/bin/env bash
set -e

# Resolve script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run Python hook runner passing stdin and args
exec python3 "${SCRIPT_DIR}/ai_log_hook.py" "$@"
