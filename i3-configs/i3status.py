from i3pystatus import Status
import os.path

status = Status()

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
                interface="wlan0",
                format_up="{essid} {quality:3.0f}%",
                color_down="#ff0000",
                color_up="#00ff00",
                )

# Displays clock like this:
# hh:mm:ss mm-dd-yyyy
status.register("clock", format=" %H:%M:%S %m-%d-%Y ", )

cpu_temp_path = "/sys/devices/platform/coretemp.0/hwmon/"
if os.path.isfile(cpu_temp_path + "hwmon0/temp1_input"):
    cpu_temp_file = cpu_temp_path + "hwmon0/temp1_input"
elif os.path.isfile(cpu_temp_path + "hwmon1/temp1_input"):
    cpu_temp_file = cpu_temp_path + "hwmon1/temp1_input"
else:
    cpu_temp_file = ""

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
                format="BAT: {status}{remaining:%E %hh:%Mm}",
                alert=True,
                alert_percentage=5,
                full_color="#efef8f",
                charging_color="#00ff00",
                critical_color="#ff0000",
                status={
                    "DIS":  "DIS",
                    "CHR":  "CHR",
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
