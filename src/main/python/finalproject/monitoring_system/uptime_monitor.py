import platform
import subprocess
from datetime import datetime, timedelta

def get_uptime():
    system = platform.system()

    if system == "Windows":
        try:
            output = subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip().splitlines()
            for line in output:
                if line.strip() and "LastBootUpTime" not in line:
                    boot_time_str = line.strip().split('.')[0]  # Remove fractions of a second
                    boot_time = datetime.strptime(boot_time_str, "%Y%m%d%H%M%S")
                    uptime = datetime.now() - boot_time
                    return uptime
        except Exception as e:
            return f"Error retrieving uptime on Windows: {e}"

    elif system == "Linux":
        try:
            with open("/proc/uptime", "r") as f:
                uptime_seconds = float(f.readline().split()[0])
                return timedelta(seconds=uptime_seconds)
        except Exception as e:
            return f"Error retrieving uptime on Linux: {e}"

    else:
        return "Unsupported operating system"

if __name__ == "__main__":
    uptime = get_uptime()
    print(f"System Uptime: {uptime}")
