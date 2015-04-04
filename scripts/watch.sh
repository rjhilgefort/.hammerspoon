#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $SCRIPT_DIR/../moon
# Compile all moon files flatly into the 'lua' folder
moonc -w -t ../lua .
