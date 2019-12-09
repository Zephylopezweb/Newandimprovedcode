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
    echo Undoing changes...
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
   
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f

SCHTASKS /Delete /TN URINFECTED 	
SCHTASKS /Delete /TN URINFECTED1 
SCHTASKS /Delete /TN URINFECTEDe 
SCHTASKS /Delete /TN URINFECTED4 
SCHTASKS /Delete /TN URINFECTE3D 
SCHTASKS /Delete /TN URI22edNFECTED 
SCHTASKS /Delete /TN URINFECewTED 
SCHTASKS /Delete /TN DRMB
SCHTASKS /Delete /TN DRMB1
SCHTASKS /Delete /TN chrome
SCHTASKS /Delete /TN drm
SCHTASKS /Delete 
SCHTASKS /Delete
del C:/Wind1
