Option Explicit
Dim shell, files, folder, python, server, edge, command
Set shell = CreateObject("WScript.Shell")
Set files = CreateObject("Scripting.FileSystemObject")
folder = files.GetParentFolderName(WScript.ScriptFullName)
python = shell.ExpandEnvironmentStrings("%LocalAppData%") & "\Programs\Python\Python314\python.exe"
server = files.BuildPath(folder, "server.py")
edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
command = Chr(34) & python & Chr(34) & " " & Chr(34) & server & Chr(34)
shell.Run command, 0, False
WScript.Sleep 1200
shell.Run Chr(34) & edge & Chr(34) & " --app=http://127.0.0.1:8765/", 1, False
