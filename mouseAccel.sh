#!/bin/bash

ID=`xinput | grep -o -P '.Razer Razer DeathAdder.*=.{0,1}' | cut -d= -f2`
xinput --set-prop $ID "Device Accel Constant Deceleration" 4
xinput --set-prop $ID "Device Accel Velocity Scaling" 1
