import csv

csv_filename = "monitoring_output.csv"

def write_csv_header():
    """Writes the CSV header to the output file."""
    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)
        writer.writerow(["Timestamp", "Computer_Name", "Total_MB", "Available_MB", "Used_MB", "CPU_Usage_Percent", 
                         "Bytes_Sent", "Bytes_Received", 
                         "File_Created", "File_Modified", "File_Deleted", "Top_Process", "Disk_Total_GB", 
                         "Disk_Used_GB", "Disk_Free_GB", "Update_OS", "Updates_Available", "Update_Titles"])

def append_to_csv(data):
    """Appends monitoring data to the CSV file."""
    with open(csv_filename, mode="a", newline="") as file:
        writer = csv.writer(file)
        writer.writerow(data)
