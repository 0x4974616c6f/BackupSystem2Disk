Set WshShell = CreateObject("WScript.Shell")
backupScriptPath = WshShell.ExpandEnvironmentStrings("%BACKUP_SCRIPT_PATH%")
batPath = backupScriptPath & "\run_backup.bat"

WshShell.Run Chr(34) & batPath & Chr(34), 0
Set WshShell = Nothing
