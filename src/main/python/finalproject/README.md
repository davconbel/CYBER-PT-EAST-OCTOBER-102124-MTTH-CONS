# 🖥️ Cross-Platform System Monitoring Suite

A Python-based multi-threaded monitoring tool for Windows and Linux systems that tracks and logs system resource usage in real-time to a CSV file. Ideal for system administrators, cybersecurity analysts, and enthusiasts.

## 🚀 Features

- ✅ **Memory Monitoring** — Total, Available, Used (MB)
- ✅ **Network Activity** — Bytes Sent & Received
- ✅ **Disk Usage** — Total, Used, Free (GB)
- ✅ **Process Monitoring** — Most CPU-intensive process
- ✅ **File System Events** — File creation, modification, deletion
- ✅ **Software Update Checker** — Pending updates (APT for Linux, Windows Update for Windows)
- ✅ **CPU Usage** — Percentage used
- ✅ **Real-time Logging** — Appends all data to a unified `monitoring_output.csv` file
- ✅ **DataMonitorAnalyzer** — Jupyter Notebook using pyspark to load and analyzed the data.
- ✅ **LogDashboard** — Load final csv files and present a final dash board

## 🛠️ Requirements

- Python 3.6+
- Packages:
  - `psutil`
  - `watchdog`
  - `pywin32` *(Windows only)*
  
Install them with:
```bash
pip install -r requirements.txt
