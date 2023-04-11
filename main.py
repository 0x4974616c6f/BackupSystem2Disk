from backup.backup import Backup

backup = Backup("config.json")
backup.schedule_backup(hour="13", minute="30")
