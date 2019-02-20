#!/bin/sh

#  dmg.sh
#  DeviceInfo
#
#  Created by Derek on 2/20/19.
#  Copyright © 2019 MTAC Research. All rights reserved.

echo "........................................................"
echo "This uses AppDMG - https://github.com/LinusU/node-appdmg"
echo "........................................................"
echo ""

appdmg app.json ~/Desktop/DeviceInfo.dmg
