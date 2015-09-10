#!/bin/bash

##
## This script must be sourced, not executed
## ie do '. mouseAccel.sh' or 'source mouseAccel.sh'
##
## do not execute this script, you'll get an error
## ie don't do './mouseAccel.sh'
##

razer_id=`xinput | grep -o -P '.Razer Razer DeathAdder.*=.[0-9]{0,3}' | cut -d= -f2`
lab_mouse_id=`xinput | grep -o -P 'Dell Premium USB Optical Mouse.*=.[0-9]{0,3}' | cut -d= -f2`

if [ ! -z "$razer_id" ]; then
  xinput --set-prop "$razer_id" "Device Accel Constant Deceleration" 4
  xinput --set-prop "$razer_id" "Device Accel Velocity Scaling" 1
  return 0
fi

if [ ! -z "$lab_mouse_id" ]; then
  xinput --set-prop "$lab_mouse_id" "Device Accel Constant Deceleration" 2;
  xinput --set-prop "$lab_mouse_id" "Device Accel Velocity Scaling" 1;
  return 0
fi
