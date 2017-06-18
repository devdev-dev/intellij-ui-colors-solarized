@echo off
color 17
mode con: cols=90 lines=25

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

::
:: Main script executed after elevation
::

echo -----------------------------------------------------------------------------------------
echo.
echo --------------------------- Solarized UI Theme for IntelliJ -----------------------------
echo.
echo -----------------------------------------------------------------------------------------

set searchDirectory="C:\Program Files\"
set searchFile=idea.jar

echo.
echo   Searching for your IntelliJ installation. 
echo   Default search directory is: %searchDirectory%?
echo.
set /p choice="> Would you like to change the search location? Type [Y]es or [N]o: " 
if /i "%choice:~0,1%"=="Y" (
  echo.
  set /p searchDirectory="> Enter the path to your IntelliJ installation: " 
)

:: search the default JetBrains directory for the idea.jar file - there can be multiple
for /d /r %searchDirectory% %%v in (%searchFile%) do if exist "%%~fv" (
    call :install "%%~fv"
  )

echo.
echo -----------------------------------------------------------------------------------------
echo.
echo -----------------------------------------------------------------------------------------
echo.
echo  Installation completed! Your IntelliJ is now solarized.
pause
exit 0

:install
echo.
echo   Would you like to install the solarized UI theme for the following version?
echo.
echo   %1
echo.
set /p choice="> Type [Y]es or [N]o: " 
if /i "%choice:~0,1%"=="Y" (
  echo.
  jar -ufv %1 com/intellij/ide/ui/laf/darcula/darcula.properties
  jar -ufv %1 com/intellij/ide/ui/laf/intellijlaf.properties
)
echo.
echo -----------------------------------------------------------------------------------------
goto :eof