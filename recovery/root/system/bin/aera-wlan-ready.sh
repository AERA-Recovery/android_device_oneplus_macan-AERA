#!/system/bin/sh
# Copyright (C) 2026 AERA Recovery Project contributors
# SPDX-License-Identifier: Apache-2.0

PATH=/system/bin:/sbin
export PATH

report() {
    echo "AERA Wi-Fi: $*" > /dev/kmsg
}

report "waiting for wlan0 after WPSS boot request"
attempt=0
while [ "$attempt" -lt 60 ]; do
    if [ -e /sys/class/net/wlan0 ]; then
        report "wlan0 appeared after ${attempt}s; requesting supplicant"
        setprop wifi.driver.ready true
        sleep 1
        report "supplicant=$(getprop init.svc.wpa_supplicant), operstate=$(cat /sys/class/net/wlan0/operstate 2>/dev/null)"
        exit 0
    fi
    case "$attempt" in
        5|15|30)
            report "still waiting after ${attempt}s; interfaces: $(ls /sys/class/net)"
            ;;
    esac
    attempt=$((attempt + 1))
    sleep 1
done
report "timeout: wlan0 did not appear; interfaces: $(ls /sys/class/net)"
for node in /sys/class/remoteproc/remoteproc*; do
    [ -r "$node/name" ] || continue
    report "remoteproc $(cat "$node/name"): $(cat "$node/state" 2>/dev/null)"
done
exit 1
