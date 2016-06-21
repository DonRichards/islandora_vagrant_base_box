#!/bin/bash

echo "Installing Sleuthkit."

SHARED_DIR=$1

if [ -f "$SHARED_DIR/configs/variables" ]; then
  # shellcheck disable=SC1090
  . "$SHARED_DIR"/configs/variables
fi

# Set apt-get for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Dependencies
apt-get install libafflib-dev afflib-tools libewf-dev ewf-tools -y --force-yes

# Clone and compile Sleuthkit
cd /tmp || exit
git clone -o 5f8a005475c3ea3e6547c3276aea381e9804c005 https://github.com/sleuthkit/sleuthkit.git
cd sleuthkit && ./bootstrap && ./configure && make && make install && ldconfig
