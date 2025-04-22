import psutil
import shutil
import time
import platform

latest_disk_stats = {}

def get_root_path():
    return "C:\\" if platform.system() == "Windows" else "/"

def monitor_disk(interval=1):
    global latest_disk_stats
    while True:
        disk = shutil.disk_usage(get_root_path())
        latest_disk_stats.update({
            "Total_GB": f"{disk.total / (1024**3):.2f}",
            "Used_GB": f"{disk.used / (1024**3):.2f}",
            "Free_GB": f"{disk.free / (1024**3):.2f}"
        })
        time.sleep(interval)