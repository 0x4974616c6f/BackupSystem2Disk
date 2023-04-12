from backup.backup import Backup

backup = Backup(r"C:\Users\italo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\BackupSystem2Disk\config.json")

backup.schedule_backup(hour="15", minute="00")
