import csv
import win32evtlog

# Define the CSV output file
log_file = 'filtered_security_events.csv'

# Define the list of event IDs you're interested in
security_event_ids = [
    4624,  # Successful logon
    4625,  # Failed logon
    4634,  # Logoff
    4648,  # Logon attempt with explicit credentials
    4670,  # Permissions on object changed
    4688,  # A new process has been created
    4689,  # A process has exited
    4720,  # A user account was created
    4722,  # A user account was enabled
    4725,  # A user account was disabled
    4726   # A user account was deleted
]

# Open the CSV file for writing
with open(log_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Time', 'Event ID', 'Event Type', 'Source', 'Category', 'Message'])

    # Specify the server (None = local) and the log name
    server = None
    log_type = 'Security'

    # Open the Windows Event Log
    event_log_handle = win32evtlog.OpenEventLog(server, log_type)

    # Read flags (read newest first, in sequence)
    flags = win32evtlog.EVENTLOG_BACKWARDS_READ | win32evtlog.EVENTLOG_SEQUENTIAL_READ

    while True:
        events = win32evtlog.ReadEventLog(event_log_handle, flags, 0)
        if not events:
            break

        for ev in events:
            try:
                # Normalize the Event ID using bitmask
                event_id = ev.EventID & 0xFFFF

                # Filter only specific event IDs
                if event_id in security_event_ids:
                    time = ev.TimeGenerated.Format()
                    event_type = ev.EventType
                    source = ev.SourceName
                    category = ev.EventCategory
                    message = ' '.join(ev.StringInserts) if ev.StringInserts else ''

                    writer.writerow([time, event_id, event_type, source, category, message])
            except Exception as e:
                print(f"Error processing event: {e}")
