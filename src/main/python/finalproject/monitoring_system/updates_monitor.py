import platform
import subprocess
import time
import csv
from csv_logger import csv_filename

latest_update_info = {"OS": "", "Update_Count": "", "Update_Titles": ""}

def monitor_updates(interval=60):  # Default: check every hour
    global latest_update_info
    while True:
        os_name = platform.system()
        if os_name == 'Windows':
            try:
                import win32com.client
                update_session = win32com.client.Dispatch("Microsoft.Update.Session")
                update_searcher = update_session.CreateUpdateSearcher()
                search_result = update_searcher.Search("IsInstalled=0 and Type='Software'")
                update_count = search_result.Updates.Count
                update_titles = [update.Title for update in search_result.Updates]
                latest_update_info.update({
                    "OS": "Windows",
                    "Update_Count": update_count,
                    "Update_Titles": ', '.join(update_titles) if update_titles else 'No updates available'
                })
            except Exception as e:
                latest_update_info.update({
                    "OS": "Windows",
                    "Update_Count": "Error",
                    "Update_Titles": str(e)
                })

        elif os_name == 'Linux':
            try:
                subprocess.run(['sudo', 'apt', 'update'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                update_output = subprocess.check_output(['apt', 'list', '--upgradable']).decode('utf-8')
                updates = [line.split('/')[0] for line in update_output.split('\n')[1:] if line]
                latest_update_info.update({
                    "OS": "Linux",
                    "Update_Count": len(updates),
                    "Update_Titles": ', '.join(updates) if updates else 'No updates available'
                })
            except Exception as e:
                latest_update_info.update({
                    "OS": "Linux",
                    "Update_Count": "Error",
                    "Update_Titles": str(e)
                })

        time.sleep(interval)