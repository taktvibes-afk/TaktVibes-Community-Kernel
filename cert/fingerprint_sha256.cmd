@echo off
setlocal
set "CERT=%~dp0TaktVibes_Community_Kernel.cer"
if not exist "%CERT%" (
  echo [ERROR] Kernel CER missing: %CERT%
  exit /b 1
)
certutil -hashfile "%CERT%" SHA256 > "%~dp0CERTIFICATE_SHA256.txt"
type "%~dp0CERTIFICATE_SHA256.txt"
