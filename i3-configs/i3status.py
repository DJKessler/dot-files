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

from i3pystatus import Status, battery
from i3pystatus.network import Network, sysfs_interface_up
import os
import fnmatch

def make_bar(percentage):
    bars = ['', '', '', '', '']
    base = 100 / len(bars)
    index = round(percentage / base) - 1
    return bars[index]

battery.make_bar = make_bar

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

# Displays clock like this:
# hh:mm:ss mm-dd-yyyy
status.register("clock", format="%H:%M:%S %m-%d-%Y", )


def find_temp_input(path):
    file_pattern = 'temp1_input'
    for root_dir, subdirs, all_files in os.walk(path):
        for name in all_files:
            if fnmatch.fnmatch(name, file_pattern):
                return os.path.join(root_dir, name)
    return ""


def find_coretemp_dir():
    dir_pattern = 'coretemp.[0-9]'
    for root_dir, subdirs, all_files in os.walk('/sys/devices/platform'):
        for name in subdirs:
            if fnmatch.fnmatch(name, dir_pattern):
                return os.path.join(root_dir, name)
    return ""


cpu_temp_file = find_temp_input(find_coretemp_dir())

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="CPU: {temp:.0f}°C",
                file=cpu_temp_file,
                alert_temp=80,
                interval=1,
                )

def is_laptop():
    with open('/sys/class/dmi/id/chassis_type') as dmi_file:
        dmi_code = int(dmi_file.read())
        return (8 <= dmi_code) and (dmi_code <= 11)
    return False

if is_laptop():
    status.register("battery",
                    format="{bar}  {status}{remaining:%E %h:%M} {percentage:.2f}%",
                    alert=True,
                    alert_percentage=5,
                    full_color="#efef8f",
                    charging_color="#009900",
                    critical_color="#ff0000",
                    status={
                        "DIS": "",
                        "CHR": "",
                        "DPL": "",
                        "FULL": "",
                    }, )

# Shows disk usage of /
# status.register("disk", path="/", format="Disk '/': {used} [{avail}G]", )

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio", format="♪{volume}", )

# Note: requires both netifaces and basiciw (for essid and quality)
status.register(NetworkUp, )

status.run()
