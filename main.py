from backup.backup import Backup

backup = Backup("config.json")
backup.schedule_backup(hour="15", minute="00")
