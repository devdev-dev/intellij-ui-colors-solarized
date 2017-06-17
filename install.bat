@echo off
 
::Windows XP doesn't have UAC so skip
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName ^| Find "ProductName"') do set WINVER=%%i %%j 
echo %WINVER% | find "XP" > nul && goto commands
 
::prompt for elevation (uac)
if "%1" == "UAC" goto elevation
(
  echo Set objShell = CreateObject^("Shell.Application"^)
  echo Set objFSO = CreateObject^("Scripting.FileSystemObject"^)
  echo strPath = objFSO.GetParentFolderName^(WScript.ScriptFullName^)
  echo If objFSO.FileExists^("%~0"^) Then
  echo   objShell.ShellExecute "cmd.exe", "/c """"%~0"" UAC ""%~dp0""""", "", "runas", 1
  echo Else
  echo   MsgBox "Script file not found"
  echo End If
) > "%TEMP%\UAC.vbs"
cscript //nologo "%TEMP%\UAC.vbs"
goto :eof
:elevation
del /q "%TEMP%\UAC.vbs"
 
:commands
::navigate back to this script's home folder
%~d2
cd "%~p2"
 
::main script here
set idea_lib_path="C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2017.1.4\lib"
set idea_jar_path="C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2017.1.4\lib\idea.jar"

jar -ufv %idea_jar_path% com/intellij/ide/ui/laf/darcula/darcula.properties
jar -ufv %idea_jar_path% com/intellij/ide/ui/laf/intellijlaf.properties

ROBOCOPY . %idea_lib_path% "idea.jar" /NJS /NJH

pause