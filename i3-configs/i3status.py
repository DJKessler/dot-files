# This script requires the following python3 packages:
#   basiciw
#   colour
#   i3pystatus
#   netifaces
#   psutil
#
# The basiciw python3 package requires libiw-dev being installed:
#   sudo apt-get install libiw-dev
#
# Install them locally with:
#   pip3 install --user basiciw colour i3pystatus netifaces psutil

from i3pystatus import Status
import os.path

status = Status()

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network", )

# Displays clock like this:
# hh:mm:ss mm-dd-yyyy
status.register("clock", format=" %H:%M:%S %m-%d-%Y ", )

def find_temp_input(path):
    file_pattern = 'temp1_input'
    for root, dirs, files in os.walk(path):
        for name in files:
            if fnmatch.fnmatch(name, file_pattern):
                return os.path.join(root, name)
    return ""

def find_coretemp_dir():
    dir_pattern = 'coretemp.[0-9]'
    for root, dirs, files in os.walk('/sys/devices/platform'):
        for name in dirs:
            if fnmatch.fnmatch(name, dir_pattern):
                return os.path.join(root, name)
    return ""

cpu_temp_file = find_temp_input(find_coretemp_dir())

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="CPU: {temp:.0f}°C",
                file=cpu_temp_file,
                alert_temp=80,
                interval=1,
                )

# Shows your CPU temperature, if you have a Intel CPU
status.register("fanspeed",
                file="/sys/devices/platform/applesmc.768/fan1_output",
                format="FAN: {speed:0.0f}%",
                max=6156,
                interval=1,
                )

# The battery monitor has many formatting options, see README for details

# This would look like this:
# Discharging 6h:51m
status.register("battery",
                format="\U0001F50B  {status}{remaining:%E %hh:%Mm}",
                alert=True,
                alert_percentage=5,
                full_color="#efef8f",
                charging_color="#009900",
                critical_color="#ff0000",
                status={
                    "DIS": "\U00002193",
                    "CHR": "\U0001F50C",
                    "FULL": "FULL",
                }, )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk", path="/", format="Disk: {used} [{avail}G]", )

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio", format="♪{volume}", )

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
                format="{title}{status}{album}",
                status={
                    "pause": "▷",
                    "play": "▶",
                    "stop": "◾",
                }, )

status.run()
