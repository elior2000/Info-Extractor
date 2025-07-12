# Info-Extractor
A real-time Bash system diagnostics tool for Linux. Extracts public and private IPs, masked MAC, default gateway, top CPU processes, memory, running services, and largest files in /home. Ideal for monitoring and auditing.


# Linux System Info Extractor

A Bash script for extracting and presenting essential system information and diagnostics on a Linux machine.

## 📋 Project Overview

This project provides a simple yet powerful Bash script designed to collect, display, and update key Linux system metrics in real time.  
The script offers quick insights into the system's network details, CPU and memory usage, running services, and file storage.

## 🚀 Features

- **Public and Private IP Address Detection**  
  Easily identify both public and internal IP addresses in use.

- **MAC Address Masking**  
  Shows the network MAC address, masking sensitive octets for privacy.

- **Default Gateway**  
  Displays the current default gateway.

- **Top 5 CPU-Consuming Processes**  
  Lists the five processes using the most CPU resources.

- **Memory Usage**  
  Shows total and available memory (RAM and swap).

- **Active Services**  
  Lists the first 10 active (running) services on the system.

- **Largest Files in /home**  
  Identifies the 10 largest files within the `/home` directory.

- **Real-Time Updates**  
  All metrics are refreshed every 10 seconds for up-to-date monitoring.

## 🛠️ Usage

1. **Clone the repository**  
   ```bash
   git clone https://github.com/elior2000/Info-Extractor.git
   cd Info-Extractor
   ```

2. **Make the script executable**
   ```bash
   chmod +x <scriptname>.sh
   ```

3. **Run the script**
   ```bash
   ./<scriptname>.sh
   ```

   *(Replace `<scriptname>.sh` with your script file name)*

4. **Stop the script**  
   Use `Ctrl+C` to stop monitoring.

## 📦 Requirements

- Bash (v4+ recommended)
- `curl`
- `ip` (from `iproute2` package)
- `ps`, `awk`, `grep`, `sort`, `head`, `free`, `systemctl`, `find`, `du` (should be available on most modern Linux distributions)

> For the most accurate results, run the script with a user account that has permission to view all running processes and services.

## 📑 Project Structure

- `CFC0324.s6.xe103.sh` — Main Bash script  
- `README.md` — This documentation file

## 🖥️ Example Output

```
================== SYSTEM DIAGNOSTICS ==================
Time: Sat Jul 12 20:05:05 IDT 2025
--------------------------------------------------------
Public IP: 46.120.203.215
Private IP(s): 192.168.1.235/24 eth0
Default Gateway: 192.168.1.1

MAC Address (eth0): 08:00:XX:XX:XX:XX

Top 5 CPU-Consuming Processes:
  PID COMMAND         %CPU
  769 Xorg             3.6
 1938 zsh              2.1
 2873 sudo             1.8
 ...

Memory Usage:
Mem:   3.8Gi   2.5Gi   1.3Gi
Swap:  2.0Gi   0.0Gi   2.0Gi

Active System Services (first 10):
...
Top 10 Largest Files in /home:
...
========================================================
Updating every 10 seconds... (Ctrl+C to exit)
```

## 📃 License

This project is for educational purposes as part of the ThinkCyber Linux Fundamentals program.  
Feel free to adapt and reuse with credit.

---

**Created by [Elior Salimi]**  
Linux Fundamentals — Project: Info Extractor
