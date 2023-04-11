Set WshShell = CreateObject("WScript.Shell")
scriptPath = WScript.ScriptFullName
scriptFolder = Left(scriptPath, InStrRev(scriptPath, "\") - 1)
batPath = scriptFolder & "\run.bat"

WshShell.Run Chr(34) & batPath & Chr(34), 0
Set WshShell = Nothing
