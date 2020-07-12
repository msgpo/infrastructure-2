#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# TODO: checkupdates exit's with 2 when no updates arrive
updates=$(/usr/bin/checkupdates || true | wc -l)
updates=$(/usr/bin/arch-audit -u | wc -l)

echo "# HELP pacman_updates_pending number of pending updates from pacman"
echo "# TYPE pacman_updates_pending gauge"
echo "pacman_updates_pending $updates"

echo "# HELP pacman_security_updates_pending number of pending updates from pacman"
echo "# TYPE pacman_security_updates_pending gauge"
echo "pacman_security_updates_pending $updates"
