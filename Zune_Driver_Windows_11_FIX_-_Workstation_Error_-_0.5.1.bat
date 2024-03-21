:: Zune Driver Windows 11 FIX - Workstation Error | Codix on r/Zune
:: Made in 2023 by Codix, the French Zuuunerzzz
:: Thanks to E'Mendo for my Zune HD, kermit the pog, Pdawg, Zunity, salt eater (not me), all the r/Zune members, yourself and coffee.

::
:: WARNING : This script go deep into the system, if you edit something here he can totally destroy your Windows, you have been warned.
::

:: Hide CMD text details and check the system architecture for RunAsTI
@echo off & if "%PROCESSOR_ARCHITECTURE%"=="ARM64" (echo [96mWARNING : YOU'RE USING WINDOWS ARM64 ! THE ZUNE SOFTWARE AND THE ZUNE DRIVER CAN'T WORK ONTO AN ARM64 COMPUTER ! Aka Surface Pro, Mac Silicon[0m & pause & exit)

set version=04/11/2023 v0.5.1

:: Start the batch script as Administrator by default, from https://stackoverflow.com/a/52517718
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Allow UTF-8 in the batch script
CHCP 65001

::Change the size of the window
mode con: cols=125 lines=35
color 8

title Zune Driver Windows 11 FIX - Workstation Error %version%

:: Allow ! instead of % in IF commands
setLocal EnableDelayedExpansion

echo -------------------------------------------------------------------------------------------------------------
echo:
echo                [38;2;250;35;165m████[0m               [96mZune Driver Windows 11 FIX - Workstation Error ^| !version! Codix on r/Zune[0m
echo            [38;2;250;50;115m███[38;2;250;35;165m█████████[0m
echo        [38;2;250;50;115m█████  ████    [38;2;250;35;165m█████[0m       This script was created to allow the installation of the necessary drivers for
echo      [38;2;250;50;115m████    ██ ██       [38;2;250;35;165m████[0m     Zune under Windows 11 even if the "Workstation Error" appears during driver
echo        [38;2;235;70;75m███████  [38;2;250;50;115m██    ██████[0m      installation. If you're not sure if you're experiencing this issue, simply ask
echo           [38;2;235;70;75m████████[38;2;250;50;115m█████  ██[0m       yourself if your Zune is appearing in your software under Windows 11. If not, this 
echo          [38;2;235;70;75m██    ████     ██[0m        script should fix the problem. This script does not require any additional 
echo         [38;2;235;70;75m██ ██████████████[0m         software. It does the following in order:
echo        [38;2;240;110;50m█████    [38;2;235;70;75m██    █████[0m       
echo      [38;2;240;110;50m████       ██  [38;2;235;70;75m███  ████[0m     -Deletes files preventing the driver from being installed.
echo        [38;2;240;110;50m█████    ██ ██ [38;2;235;70;75m█████[0m       -Automatic copying of all language files (.mui) from C:\Program Files\Zune\Driver\Zune
echo            [38;2;240;110;50m████████████[0m           -Reinstalls of your Zune on the system for detection.
echo                [38;2;240;110;50m████[0m               -Normally, the Zune software should start automatically. If not, you can start it
echo                                   manually.
echo:
echo                                   It is not necessary to close the Zune software on your computer during the use
echo                                   of this script.
echo:
echo                                   If you had other popup showing in blue (PowerShell window) this is normal, it's
echo                                   for executing commands as Trusted Installer, you had to wait approximatively
echo                                   15 seconds for it to finish.
echo:
echo                                   [96mWARNING:[0m This script modifies very important system files with complete 
echo                                   system rights. IT WILL ALSO DELETE YOUR ZUNE AND WINDOWS PHONE 7 DEVICE
echo                                   FROM THE DEVICE MANAGER ! I am not responsible in any way if your computer
echo                                   fails to function properly after using this script (tested on Windows 11 22H2/23H2).
echo:
echo -------------------------------------------------------------------------------------------------------------
pause
cls
:: Delete all the previous language files who block the driver while he try to install itself with Trusted Installer right, can be converted to use a loop instead with the different countries and languages.
call :RunAsTI ""cmd.exe /c del C:\WINDOWS\system32\cz-CZ\ZuneCoInst.dll.mui C:\WINDOWS\system32\da-DK\ZuneCoInst.dll.mui C:\WINDOWS\system32\de-DE\ZuneCoInst.dll.mui C:\WINDOWS\system32\el-GR\ZuneCoInst.dll.mui C:\WINDOWS\system32\en-US\ZuneCoInst.dll.mui C:\WINDOWS\system32\es-ES\ZuneCoInst.dll.mui C:\WINDOWS\system32\fi-FI\ZuneCoInst.dll.mui C:\WINDOWS\system32\fr-FR\ZuneCoInst.dll.mui C:\WINDOWS\system32\hu-HU\ZuneCoInst.dll.mui C:\WINDOWS\system32\id-ID\ZuneCoInst.dll.mui C:\WINDOWS\system32\it-IT\ZuneCoInst.dll.mui C:\WINDOWS\system32\ja-JP\ZuneCoInst.dll.mui C:\WINDOWS\system32\ko-KR\ZuneCoInst.dll.mui C:\WINDOWS\system32\ms-MY\ZuneCoInst.dll.mui C:\WINDOWS\system32\nb-NO\ZuneCoInst.dll.mui C:\WINDOWS\system32\nl-NL\ZuneCoInst.dll.mui C:\WINDOWS\system32\pl-PL\ZuneCoInst.dll.mui C:\WINDOWS\system32\pt-BR\ZuneCoInst.dll.mui C:\WINDOWS\system32\pt-PT\ZuneCoInst.dll.mui C:\WINDOWS\system32\ru-RU\ZuneCoInst.dll.mui C:\WINDOWS\system32\sv-SE\ZuneCoInst.dll.mui C:\WINDOWS\system32\zh-CN\ZuneCoInst.dll.mui C:\WINDOWS\system32\zh-TW\ZuneCoInst.dll.mui""


:: Create the temp script to run as ExecTI (in this new version this allow a faster copy /Y of all the files without multiples PowerShell popup)
(echo @echo off & echo title This window is just to see if all the files were correctly copied, in case of issue verify that all the files are correctly copied & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\cs-CZ\cs-CZ-ZuneCoInst.dll.mui" C:\WINDOWS\system32\cs-CZ\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\da-DK\da-DK-ZuneCoInst.dll.mui" C:\WINDOWS\system32\da-DK\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\de-DE\de-DE-ZuneCoInst.dll.mui" C:\WINDOWS\system32\de-DE\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\el-GR\el-GR-ZuneCoInst.dll.mui" C:\WINDOWS\system32\el-GR\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\en-US\ZuneCoInst.dll.mui" C:\WINDOWS\system32\en-US\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\es-ES\es-ES-ZuneCoInst.dll.mui" C:\WINDOWS\system32\es-ES\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\fi-FI\fi-FI-ZuneCoInst.dll.mui" C:\WINDOWS\system32\fi-FI\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\fr-FR\fr-FR-ZuneCoInst.dll.mui" C:\WINDOWS\system32\fr-FR\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\hu-HU\hu-HU-ZuneCoInst.dll.mui" C:\WINDOWS\system32\hu-HU\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\id-ID\id-ID-ZuneCoInst.dll.mui" C:\WINDOWS\system32\id-ID\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\it-IT\it-IT-ZuneCoInst.dll.mui" C:\WINDOWS\system32\it-IT\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\ja-JP\ja-JP-ZuneCoInst.dll.mui" C:\WINDOWS\system32\ja-JP\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\ko-KR\ko-KR-ZuneCoInst.dll.mui" C:\WINDOWS\system32\ko-KR\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\ms-MY\ms-MY-ZuneCoInst.dll.mui" C:\WINDOWS\system32\ms-MY\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\nb-NO\nb-NO-ZuneCoInst.dll.mui" C:\WINDOWS\system32\nb-NO\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\nl-NL\nl-NL-ZuneCoInst.dll.mui" C:\WINDOWS\system32\nl-NL\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\pl-PL\pl-PL-ZuneCoInst.dll.mui" C:\WINDOWS\system32\pl-PL\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\pt-BR\pt-BR-ZuneCoInst.dll.mui" C:\WINDOWS\system32\pt-BR\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\pt-PT\pt-PT-ZuneCoInst.dll.mui" C:\WINDOWS\system32\pt-PT\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\ru-RU\ru-RU-ZuneCoInst.dll.mui" C:\WINDOWS\system32\ru-RU\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\sv-SE\sv-SE-ZuneCoInst.dll.mui" C:\WINDOWS\system32\sv-SE\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\zh-CN\zh-CN-ZuneCoInst.dll.mui" C:\WINDOWS\system32\zh-CN\ZuneCoInst.dll.mui & echo copy /Y "C:\Program Files\Zune\Drivers\Zune\zh-TW\zh-TW-ZuneCoInst.dll.mui" C:\WINDOWS\system32\zh-TW\ZuneCoInst.dll.mui & echo timeout /t 25) > %TEMP%\zunefix.bat


:: Copy all the rights language files with Trusted Installer rights
call :RunAsTI ""cmd.exe /C %TEMP%\zunefix.bat""

echo This timeout is here to prevent the script to continue before all the PowerShell window aren't closed, if there is nothing more just skip it.

timeout /t 15
del /Y %TEMP%\zunefix.bat

echo This is the moment of truth ! This commands scan the system to search for the Zune that shoud had the right driver.
pnputil /add-driver "C:\Program Files\Zune\Drivers\Zune\Zune.inf" /install
pnputil /scan-devices

echo -------------------------------------------------------------------------------------------------------------
echo It seems that the script ended up, now it's your turn to verify that everything is ok with it !
echo If anything goes wrong you can contact me or find help into the Reddit page "r/Zune" or directly onto our Discord server !
echo:
echo [96mhttps://invite.gg/zune[0m
pause
exit

:: If you still had any issue with your Zune or you want to know what CMD commands this script use, look at this list of commands :
::
:: del C:\WINDOWS\system32\fr-FR\ZuneCoInst.dll.mui
:: copy C:\Windows\System32\DriverStore\FileRepository\zune.inf_amd64_bae1a2a65e3c2cfb\fr-FR\fr-FR-ZuneCoInst.dll.mui C:\WINDOWS\system32\fr-FR\ZuneCoInst.dll.mui
::
:: If you still had any issue with those driver you can check this logfile (at the end of it where there is !!! about an "Access Denied") : %SystemRoot%\inf\SetupAPI.dev.log
::

#:RunAsTI snippet to run as TI/System, with innovative HKCU load, ownership privileges, high priority, and explorer support  
set ^ #=& set "0=%~f0"& set 1=%*& powershell -c iex(([io.file]::ReadAllText($env:0)-split'#\:RunAsTI .*')[1])& exit /b
function RunAsTI ($cmd,$arg) { $id='RunAsTI'; $key="Registry::HKU\$(((whoami /user)-split' ')[-1])\Volatile Environment"; $code=@'
 $I=[int32]; $M=$I.module.gettype("System.Runtime.Interop`Services.Mar`shal"); $P=$I.module.gettype("System.Int`Ptr"); $S=[string]
 $D=@(); $T=@(); $DM=[AppDomain]::CurrentDomain."DefineDynami`cAssembly"(1,1)."DefineDynami`cModule"(1); $Z=[uintptr]::size 
 0..5|% {$D += $DM."Defin`eType"("AveYo_$_",1179913,[ValueType])}; $D += [uintptr]; 4..6|% {$D += $D[$_]."MakeByR`efType"()}
 $F='kernel','advapi','advapi', ($S,$S,$I,$I,$I,$I,$I,$S,$D[7],$D[8]), ([uintptr],$S,$I,$I,$D[9]),([uintptr],$S,$I,$I,[byte[]],$I)
 0..2|% {$9=$D[0]."DefinePInvok`eMethod"(('CreateProcess','RegOpenKeyEx','RegSetValueEx')[$_],$F[$_]+'32',8214,1,$S,$F[$_+3],1,4)}
 $DF=($P,$I,$P),($I,$I,$I,$I,$P,$D[1]),($I,$S,$S,$S,$I,$I,$I,$I,$I,$I,$I,$I,[int16],[int16],$P,$P,$P,$P),($D[3],$P),($P,$P,$I,$I)
 1..5|% {$k=$_; $n=1; $DF[$_-1]|% {$9=$D[$k]."Defin`eField"('f' + $n++, $_, 6)}}; 0..5|% {$T += $D[$_]."Creat`eType"()}
 0..5|% {nv "A$_" ([Activator]::CreateInstance($T[$_])) -fo}; function F ($1,$2) {$T[0]."G`etMethod"($1).invoke(0,$2)}   
 $TI=(whoami /groups)-like'*1-16-16384*'; $As=0; if(!$cmd) {$cmd='control';$arg='admintools'}; if ($cmd-eq'This PC'){$cmd='file:'}
 if (!$TI) {'TrustedInstaller','lsass','winlogon'|% {if (!$As) {$9=sc.exe start $_; $As=@(get-process -name $_ -ea 0|% {$_})[0]}}
 function M ($1,$2,$3) {$M."G`etMethod"($1,[type[]]$2).invoke(0,$3)}; $H=@(); $Z,(4*$Z+16)|% {$H += M "AllocHG`lobal" $I $_}
 M "WriteInt`Ptr" ($P,$P) ($H[0],$As.Handle); $A1.f1=131072; $A1.f2=$Z; $A1.f3=$H[0]; $A2.f1=1; $A2.f2=1; $A2.f3=1; $A2.f4=1
 $A2.f6=$A1; $A3.f1=10*$Z+32; $A4.f1=$A3; $A4.f2=$H[1]; M "StructureTo`Ptr" ($D[2],$P,[boolean]) (($A2 -as $D[2]),$A4.f2,$false)
 $Run=@($null, "powershell -win 1 -nop -c iex `$env:R; # $id", 0, 0, 0, 0x0E080600, 0, $null, ($A4 -as $T[4]), ($A5 -as $T[5]))
 F 'CreateProcess' $Run; return}; $env:R=''; rp $key $id -force; $priv=[diagnostics.process]."GetM`ember"('SetPrivilege',42)[0]   
 'SeSecurityPrivilege','SeTakeOwnershipPrivilege','SeBackupPrivilege','SeRestorePrivilege' |% {$priv.Invoke($null, @("$_",2))}
 $HKU=[uintptr][uint32]2147483651; $NT='S-1-5-18'; $reg=($HKU,$NT,8,2,($HKU -as $D[9])); F 'RegOpenKeyEx' $reg; $LNK=$reg[4]
 function L ($1,$2,$3) {sp 'HKLM:\Software\Classes\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2}' 'RunAs' $3 -force -ea 0
  $b=[Text.Encoding]::Unicode.GetBytes("\Registry\User\$1"); F 'RegSetValueEx' @($2,'SymbolicLinkValue',0,6,[byte[]]$b,$b.Length)}
 function Q {[int](gwmi win32_process -filter 'name="explorer.exe"'|?{$_.getownersid().sid-eq$NT}|select -last 1).ProcessId}
 $11bug=($((gwmi Win32_OperatingSystem).BuildNumber)-eq'22000')-AND(($cmd-eq'file:')-OR(test-path -lit $cmd -PathType Container))
 if ($11bug) {'System.Windows.Forms','Microsoft.VisualBasic' |% {[Reflection.Assembly]::LoadWithPartialName("'$_")}}
 if ($11bug) {$path='^(l)'+$($cmd -replace '([\+\^\%\~\(\)\[\]])','{$1}')+'{ENTER}'; $cmd='control.exe'; $arg='admintools'}
 L ($key-split'\\')[1] $LNK ''; $R=[diagnostics.process]::start($cmd,$arg); if ($R) {$R.PriorityClass='High'; $R.WaitForExit()}
 if ($11bug) {$w=0; do {if($w-gt40){break}; sleep -mi 250;$w++} until (Q); [Microsoft.VisualBasic.Interaction]::AppActivate($(Q))}
 if ($11bug) {[Windows.Forms.SendKeys]::SendWait($path)}; do {sleep 7} while(Q); L '.Default' $LNK 'Interactive User'
'@; $V='';'cmd','arg','id','key'|%{$V+="`n`$$_='$($(gv $_ -val)-replace"'","''")';"}; sp $key $id $($V,$code) -type 7 -force -ea 0
 start powershell -args "-win 1 -nop -c `n$V `$env:R=(gi `$key -ea 0).getvalue(`$id)-join''; iex `$env:R" -verb runas
}; $A=$env:1-split'"([^"]+)"|([^ ]+)',2|%{$_.Trim(' "')}; RunAsTI $A[1] $A[2]; #:RunAsTI lean & mean snippet by AveYo, 2022.01.28
#RunAsTI from https://forums.mydigitallife.net/threads/run-file-manager-as-trustedinstaller.84372/ thanks to him !