#!/usr/bin/bash
set -euf -o pipefail

echo $PROTONMAIL_USERNAME
/opt/proton-bridge/login.exp
/opt/proton-bridge/getpass.exp
/usr/bin/protonmail-bridge --cli --no-window