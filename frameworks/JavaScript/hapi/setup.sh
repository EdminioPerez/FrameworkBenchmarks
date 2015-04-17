#!/bin/bash

sed -i 's|localhost|'"${DBHOST}"'|g' app.js

fw_depends nodejs

npm install
node app &

# !DO NOT REMOVE!
#
# It takes `node app` a few seconds to turn on and 
# then fork. If you remove this sleep, the parent shell 
# executing this script will be terminated before the 
# application has time to awaken and be forked, and 
# express will fail to be started
sleep 5
