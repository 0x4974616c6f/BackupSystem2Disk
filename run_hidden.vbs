Set WshShell = CreateObject("WScript.Shell")
batPath = "C:\Users\italo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\BackupSystem2Disk\run.bat"

WshShell.Run Chr(34) & batPath & Chr(34), 0
Set WshShell = Nothing
