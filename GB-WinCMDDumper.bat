::    This program is free software: you can redistribute it and/or modify
::    it under the terms of the GNU General Public License as published by
::    the Free Software Foundation, either version 3 of the License, or
::    (at your option) any later version.
::
::    This program is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU General Public License for more details.
::
::    You should have received a copy of the GNU General Public License
::    along with this program.  If not, see <https://www.gnu.org/licenses/>.

@echo off

echo ******************************************************************
echo * Windows CMD Dumper                                             *
echo * Copyright (c) 2022 GlobBruh                                    *
echo *                                                                *
echo * This program comes with ABSOLUTELY NO WARRANTY.                *
echo * This is free software, and you are welcome to redistribute it  *
echo * under certain conditions.                                      *
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

echo Regestry Dump - HKLM...
reg export HKLM .\GlobBruhDUMP\RegHKLM.reg
echo Regestry Dump - HKCU...
reg export HKCU .\GlobBruhDUMP\RegHKCU.reg
echo Regestry Dump - HKCR...
reg export HKCR .\GlobBruhDUMP\RegHKCR.reg
echo Regestry Dump - HKU...
reg export HKU .\GlobBruhDUMP\RegHKU.reg
echo Regestry Dump - HKCC...
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

echo Copy MalwareBytes Logs...
mkdir .\GlobBruhDUMP\MalwarebyesLogs
copy C:\ProgramData\Malwarebytes\MBAMService\ScanResults\ .\GlobBruhDUMP\MalwarebyesLogs

echo Compress Folder...
powershell Compress-Archive ./GlobBruhDUMP/ ./GLOBBRUH-DUMP.zip
powershell rm -r ./GlobBruhDUMP

echo Done!
@echo on