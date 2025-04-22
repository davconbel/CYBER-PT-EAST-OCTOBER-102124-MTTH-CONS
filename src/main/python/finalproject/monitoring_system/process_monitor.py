import psutil
import time

latest_process = {"name": ""}  # Use a dictionary to store the top process

def monitor_process(interval=1):
    """Finds the most CPU-intensive process name and updates the global dictionary."""
    global latest_process
    while True:
        try:
            # Get all running processes with their CPU usage
            processes = sorted(
                [(p.info['name'], p.info['cpu_percent']) for p in psutil.process_iter(attrs=['name', 'cpu_percent'])],
                key=lambda x: x[1],  # Sort by CPU usage (Descending)
                reverse=True
            )

            # Select the process with the highest CPU usage or set "N/A"
            if processes and processes[0][1] > 0:  # Ensure CPU usage is > 0
                latest_process["name"] = processes[2][0], processes[1][0]
            else:
                latest_process["name"] = ""
        
        except Exception:
            latest_process["name"] = ""
        
        time.sleep(interval)
