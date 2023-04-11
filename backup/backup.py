import json
import os
import shutil
import datetime
import schedule
import time

class Backup:
    def __init__(self, config_file):
        self.config_file = config_file
        self.load_config()

    def load_config(self):
        with open(self.config_file) as f:
            self.config = json.load(f)

    def backup_files(self):
        source_folder = self.config["source_folder"]
        dest_folder = self.config["dest_folder"]

        for root, dirs, files in os.walk(source_folder):
            for dir in dirs:
                src_dir = os.path.join(root, dir)
                dest_dir = os.path.join(dest_folder, os.path.relpath(src_dir, source_folder))

                if not os.path.exists(dest_dir):
                    os.makedirs(dest_dir)

            for file in files:
                src_file = os.path.join(root, file)
                dest_file = os.path.join(dest_folder, os.path.relpath(src_file, source_folder))

                if os.path.exists(dest_file):
                    src_mod_time = os.path.getmtime(src_file)
                    dest_mod_time = os.path.getmtime(dest_file)

                    if src_mod_time > dest_mod_time:
                        shutil.copy2(src_file, dest_file)
                else:
                    shutil.copy2(src_file, dest_file)


    def schedule_backup(self, hour=15, minute=0):
        schedule.every().day.at(f"{hour}:{minute}").do(self.backup_files)

        while True:
            schedule.run_pending()
            time.sleep(1)
