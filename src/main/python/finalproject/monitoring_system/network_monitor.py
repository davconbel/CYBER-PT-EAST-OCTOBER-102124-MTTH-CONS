import psutil
import time

latest_network_stats = {}  # Global dictionary

def monitor_network(interval=1):
    """Monitors network usage and updates the global variable."""
    prev = psutil.net_io_counters()
    global latest_network_stats
    while True:
        time.sleep(interval)
        net_io_counters = psutil.net_io_counters()
        latest_network_stats.update({
            "Bytes_Sent": net_io_counters.bytes_sent - prev.bytes_sent,
            "Bytes_Received": net_io_counters.bytes_recv - prev.bytes_recv
        })
        prev = net_io_counters
