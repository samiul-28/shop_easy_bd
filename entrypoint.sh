#!/bin/bash
set -e

# Remove pre-existing server.pid
rm -f /app/tmp/pids/server.pid

# Run the main container command
exec "$@"
