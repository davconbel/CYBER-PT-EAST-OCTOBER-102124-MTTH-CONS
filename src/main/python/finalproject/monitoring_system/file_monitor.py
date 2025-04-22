import logging
import time
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

latest_file_events = {"File_Created": "", "File_Modified": "", "File_Deleted": ""}  # Global dictionary

class MyEventHandler(FileSystemEventHandler):
    """Handles file system events and updates the global dictionary."""
    def on_created(self, event):
        latest_file_events["File_Created"] = event.src_path

    def on_modified(self, event):
        latest_file_events["File_Modified"] = event.src_path

    def on_deleted(self, event):
        latest_file_events["File_Deleted"] = event.src_path

    def on_moved(self, event):
        latest_file_events["File_Created"] = event.dest_path
        latest_file_events["File_Deleted"] = event.src_path

def monitor_filesystem(path="."):
    """Monitors file system changes and logs events."""
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')
    
    event_handler = MyEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
