import time
import sys
import threading
import socket
from memory_monitor import monitor_memory, latest_memory_stats
from network_monitor import monitor_network, latest_network_stats
from process_monitor import monitor_process, latest_process
from file_monitor import monitor_filesystem, latest_file_events
from disk_monitor import monitor_disk, latest_disk_stats  # NEW MODULE
from csv_logger import write_csv_header, append_to_csv
from updates_monitor import monitor_updates, latest_update_info
from cpu_monitor import monitor_cpu, latest_cpu_stats

def main():
    import os
    path = sys.argv[1] if len(sys.argv) > 1 else os.path.expanduser('~')

    # Start monitoring in separate threads
    memory_thread = threading.Thread(target=monitor_memory, daemon=True)
    network_thread = threading.Thread(target=monitor_network, daemon=True)
    process_thread = threading.Thread(target=monitor_process, daemon=True)
    filesystem_thread = threading.Thread(target=monitor_filesystem, args=(path,), daemon=True)
    disk_thread = threading.Thread(target=monitor_disk, daemon=True)  # NEW THREAD
    updates_thread = threading.Thread(target=monitor_updates, daemon=True)
    cpu_thread = threading.Thread(target=monitor_cpu, daemon=True)

    memory_thread.start()
    network_thread.start()
    process_thread.start()
    filesystem_thread.start()
    disk_thread.start()  # START DISK MONITORING
    updates_thread.start()
    cpu_thread.start()

    # Write CSV header
    write_csv_header()

    try:
        while True:
            timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
            computer_name = socket.gethostname()

            # Ensure all data is correctly referenced from the shared mutable variables
            data = [
                timestamp,
                computer_name,
                latest_memory_stats.get("Total_MB", ""),
                latest_memory_stats.get("Available_MB", ""),
                latest_memory_stats.get("Used_MB", ""),
                latest_cpu_stats.get("CPU_Usage_Percent", "N/A"),                
                latest_network_stats.get("Bytes_Sent", ""),
                latest_network_stats.get("Bytes_Received", ""),
                latest_file_events.get("File_Created", ""),
                latest_file_events.get("File_Modified", ""),
                latest_file_events.get("File_Deleted", ""),
                latest_process["name"],  # Process Name
                latest_disk_stats.get("Total_GB", ""),  # Disk Total
                latest_disk_stats.get("Used_GB", ""),   # Disk Used
                latest_disk_stats.get("Free_GB", ""),
                latest_update_info.get("OS", ""),
                latest_update_info.get("Update_Count", ""),
                latest_update_info.get("Update_Titles", "")
            ]
            
            # Print CSV-formatted data to console
            print(",".join(map(str, data)))
            
            # Append data to CSV file
            append_to_csv(data)
            
            time.sleep(1)  # Output data every second

    except KeyboardInterrupt:
        print("\nStopping monitoring...")

if __name__ == "__main__":
    main()
