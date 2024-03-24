import os
import shutil
import subprocess

def move_qml_files(source_dir, destination_dir):
    # Create destination directory if it doesn't exist
    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)

    # Get list of .qml files in source directory
    qml_files = [file for file in os.listdir(source_dir) if file.endswith('.qml')]

    if not qml_files:
        print("No .qml files found in the source directory.")
        return

    for file in qml_files:
      try:
          # Move .qml files to destination directory
    
          # Git add and commit changes
          subprocess.run(['git', 'mv', file, destination_dir])
          print(file)
      except Exception as e:
          print(f"An error occurred: {str(e)}")

if __name__ == "__main__":

#    source_directory = "."
#    destination_directory = "./qml"

    if len(sys.argv) != 3:
        print("Usage: python script.py <source_directory> <destination_directory>")
        sys.exit(1)

    source_directory = sys.argv[1]
    destination_directory = sys.argv[2]

    if not os.path.exists(source_directory):
        print(f"Source directory '{source_directory}' does not exist.")
        sys.exit(1)

    if not os.path.exists(destination_directory):
        print(f"Destination directory '{destination_directory}' does not exist.")
        sys.exit(1)

    move_qml_files(source_directory, destination_directory)
