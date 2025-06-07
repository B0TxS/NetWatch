# NetWatch

**NetWatch** is a lightweight, fast, and native Windows batch script that scans your local network to identify connected devices. It uses built-in Windows tools like `ping`, `arp`, and `nbtstat` to detect and display the IP addresses, MAC addresses, and device names of machines on the same subnet.


## Features

- Fast scanning of your local network (up to 30 devices by default)
- Displays IP Address, MAC Address, and Hostname
- No installation required — runs as a simple `.bat` file
- Uses only built-in Windows command-line tools
- Simple, readable terminal interface


## How It Works

1. Detects your local IP address and subnet.
2. Pings the first 30 IP addresses in the subnet to populate the ARP cache.
3. Uses `arp -a` to extract IP and MAC address information.
4. Attempts to resolve hostnames using `nbtstat`.


## Requirements

- Windows 7, 8, 10, or 11
- Command Prompt (`cmd.exe`)
- Administrator privileges (recommended for best results)


## Usage

1. Download or clone the repository.
2. Right-click `NetWatch.bat` and select **"Run as Administrator"**.
3. Wait for the scan to complete.
4. Connected devices will be listed in the terminal window.

## Screenshots

![Screenshot](https://github.com/user-attachments/assets/f8c3a7bb-b77f-4ade-9aee-021d57338d38)

-The picture is edited in order to exlude any of my personal info 

## Notes

- Hostnames may appear as `Unknown` if NetBIOS is disabled or blocked.
- To perform a full scan (1–254), modify the IP loop range in the script.
- Designed for small local area networks (LAN).

## License

This project is open-source and free to use under the MIT License.

## Author

Created by — B0TxS
