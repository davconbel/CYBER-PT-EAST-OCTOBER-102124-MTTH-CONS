import psutil
import time

latest_cpu_stats = {"CPU_Usage_Percent": ""}

def monitor_cpu(interval=1):
    global latest_cpu_stats
    while True:
        cpu_percent = psutil.cpu_percent(interval=None)  # Non-blocking
        latest_cpu_stats["CPU_Usage_Percent"] = cpu_percent
        time.sleep(interval)