
:: WINDOWS CMD DUMPER

@echo off

echo ******************************************************************
echo * Windows CMD Dumper                                             *
echo * By: GlobBruh                                                   *
echo *                                                                *
echo * Instructions available in the README.md file or on GitHub.     *
echo *                                                                *
echo * https://github.com/glob-bruh/WindowsCMDDumper                  *
echo ******************************************************************

echo Preparation...
cd %HOMEPATH%\Desktop\
mkdir .\GlobBruhDUMP
whoami > .\GlobBruhDUMP\GENERALINFO.txt
time /T >> .\GlobBruhDUMP\GENERALINFO.txt
date /T >> .\GlobBruhDUMP\GENERALINFO.txt

echo Filelist Simple...
dir /b /s /a \ > .\GlobBruhDUMP\FilelistSIMPLE.txt
echo Filelist Normal...
dir /s /a \ > .\GlobBruhDUMP\FileListNORMAL.txt
echo Filelist Detailed...
dir /4 /s /q /a \ > .\GlobBruhDUMP\FilelistDETAILED.txt

echo Registry Dump - HKLM...
reg export HKLM .\GlobBruhDUMP\RegHKLM.reg
echo Registry Dump - HKCU...
reg export HKCU .\GlobBruhDUMP\RegHKCU.reg
echo Registry Dump - HKCR...
reg export HKCR .\GlobBruhDUMP\RegHKCR.reg
echo Registry Dump - HKU...
reg export HKU .\GlobBruhDUMP\RegHKU.reg
echo Registry Dump - HKCC...
reg export HKCC .\GlobBruhDUMP\RegHKCC.reg

echo Tasklist Normal...
tasklist /v > .\GlobBruhDUMP\TasklistNORMAL.txt
echo Tasklist Module...
tasklist /m > .\GlobBruhDUMP\TasklistMODULE.txt
echo Tasklist Apps...
tasklist /apps /v > .\GlobBruhDUMP\TasklistAPPS.txt
echo Tasklist Services...
tasklist /svc > .\GlobBruhDUMP\TasklistSERVICES.txt

echo Netstat Normal...
netstat -a -q > .\GlobBruhDUMP\NetstatNORMAL.txt
echo Netstat Detailed...
netstat -a -q -b -o > .\GlobBruhDUMP\NetstatDETAILED.txt
echo Netstat Stats...
netstat -s > .\GlobBruhDUMP\NetstatSTATS.txt

echo Compress Folder...
powershell Compress-Archive ./GlobBruhDUMP/ ./GLOBBRUH-DUMP.zip
rmdir /s /q .\GlobBruhDUMP

echo Done!
echo **********************************************
echo * You can find the zip file on the Desktop!  *
echo **********************************************
pause
@echo on
