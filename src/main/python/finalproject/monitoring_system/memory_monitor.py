import psutil
import time

latest_memory_stats = {}  # Global dictionary

def monitor_memory(interval=1):
    """Monitors memory usage and updates the global variable."""
    global latest_memory_stats
    while True:
        memory = psutil.virtual_memory()
        latest_memory_stats.update({
            "Total_MB": f"{memory.total / (1024**2):.2f}",
            "Available_MB": f"{memory.available / (1024**2):.2f}",
            "Used_MB": f"{memory.used / (1024**2):.2f}"
        })
        time.sleep(interval)
