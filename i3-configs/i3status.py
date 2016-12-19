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
from i3pystatus.network import Network, sysfs_interface_up
import os, fnmatch

status = Status()


class NetworkUp(Network):
    """
    Modified Network class that automatic switch interface in case of
    the current interface is down.
    """
    on_upscroll = None
    on_downscroll = None

    def run(self):
        super().run()
        if not sysfs_interface_up(self.interface, self.unknown_up):
            self.cycle_interface()


# Note: requires both netifaces and basiciw (for essid and quality)
status.register(NetworkUp, )

# Displays clock like this:
# hh:mm:ss mm-dd-yyyy
status.register("clock", format="%H:%M:%S %m-%d-%Y", )


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

# The battery monitor has many formatting options, see README for details

for root, dirs, files in os.walk('/sys/class/power_supply'):
    if not dirs:
        break
    else:
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
        break

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
