@echo off
setlocal
cd /d "%~dp0"
where cl >nul 2>nul
if errorlevel 1 (
  echo Run this script from an x86 Native Tools Command Prompt for Visual Studio.
  exit /b 1
)
if not exist build mkdir build
cl /nologo /LD /O2 /GS- /Zl /W4 outputs\NFSMWAIPlayerFixes.cpp /Fobuild\NFSMWAIPlayerFixes.obj /link /NODEFAULTLIB /ENTRY:DllMain /MACHINE:X86 /DYNAMICBASE /NXCOMPAT kernel32.lib libcmt.lib libvcruntime.lib libucrt.lib /OUT:build\NFSMWAIPlayerFixes.asi /IMPLIB:build\NFSMWAIPlayerFixes.lib /MAP:build\NFSMWAIPlayerFixes.map
if errorlevel 1 exit /b 1
copy /y outputs\NFSMWAIPlayerFixes.ini build\NFSMWAIPlayerFixes.ini >nul
