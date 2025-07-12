#!/bin/bash
# INFO EXTRACTOR - Linux System Diagnostics Script

# Function to mask MAC address (show only first 2 octets)
mask_mac() {
    echo "$1" | awk -F':' '{print toupper($1":"$2)":XX:XX:XX:XX"}'
}

while true; do
    clear
    echo "================== SYSTEM DIAGNOSTICS =================="
    echo "Time: $(date)"
    echo "--------------------------------------------------------"

    # Public IP
    echo -n "Public IP: "
    curl -s ifconfig.me || curl -s icanhazip.com
    echo

    # Get default interface
    IFACE=$(ip route | grep default | awk '{print $5}' | head -n1)

    # Private IP(s)
    PRIV_IP=$(ip -4 addr show $IFACE | grep inet | awk '{print $2, $NF}')
    echo "Private IP(s): $PRIV_IP"

    # Default Gateway
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    echo "Default Gateway: $GATEWAY"
    echo

    # MAC address (masked)
    MAC=$(cat /sys/class/net/$IFACE/address)
    echo "MAC Address (${IFACE}): $(mask_mac $MAC)"
    echo

    # CPU Usage (top 5 processes)
    echo "Top 5 CPU-Consuming Processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo

    # Memory usage
    echo "Memory Usage:"
    free -h | grep -E "Mem|Swap"
    echo

    # Active services with status
    echo "Active System Services (first 10):"
    systemctl list-units --type=service --state=running | head -n 12
    echo

    # Top 10 largest files in /home
    echo "Top 10 Largest Files in /home:"
    find /home -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10
    echo

    echo "========================================================"
    echo "Updating every 10 seconds... (Ctrl+C to exit)"
    sleep 10
done
