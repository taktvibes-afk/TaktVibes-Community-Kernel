@echo off
setlocal
set "ROOT=%~dp0"
for /r "%ROOT%" %%F in (*.pfx *.p12 *.pvk *.key) do (
 echo [ERROR] Private key material found: %%F
 exit /b 10
)
if not exist "%ROOT%cert\TaktVibes_Community_Kernel.cer" (
 echo [NOT OFFICIAL] Kernel CER missing.
 exit /b 20
)
if not exist "%ROOT%release\TaktVibes_Community_Kernel.elf.p7s" (
 echo [NOT OFFICIAL] Detached signature missing.
 exit /b 21
)
call "%ROOT%verify_hash.cmd" "%ROOT%release\TaktVibes_Community_Kernel.elf" || exit /b 22
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%verify_signature.ps1" || exit /b 23
echo OFFICIAL CRYPTO CHECK PASS
exit /b 0
