@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "FILE=%~1"
if "%FILE%"=="" set "FILE=%~dp0release\TaktVibes_Community_Kernel.elf"
if not exist "%FILE%" (echo [ERROR] File not found: %FILE% & exit /b 1)
for /f "usebackq delims=" %%H in (`powershell -NoProfile -Command "(Get-FileHash -LiteralPath '%FILE%' -Algorithm SHA256).Hash.ToLowerInvariant()"`) do set "HASH=%%H"
echo SHA-256: !HASH!
if /I "%FILE%"=="%~dp0release\TaktVibes_Community_Kernel.elf" (
  findstr /I /C:"!HASH!" "%~dp0SHA256SUMS.txt" >nul || (echo HASH MISMATCH & exit /b 2)
  echo HASH VERIFIED
)
