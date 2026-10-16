@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "ROOT=%~dp0"
set "SRC=%ROOT%src\community_kernel.c"
set "LD=%ROOT%linker\community_kernel.ld"
set "OBJ=%ROOT%build\community_kernel.o"
set "OUT=%ROOT%build\KERNEL\TaktVibes_Community_Kernel.elf"
where clang.exe >nul 2>nul || (echo [ERROR] clang.exe not found & exit /b 1)
where ld.lld.exe >nul 2>nul || (echo [ERROR] ld.lld.exe not found & exit /b 1)
if not exist "%ROOT%build\KERNEL" mkdir "%ROOT%build\KERNEL"
if exist "%OUT%" del /q "%OUT%"
clang -target x86_64-unknown-none-elf -ffreestanding -fno-stack-protector -fno-pic -mno-red-zone -O2 -Wall -Wextra -Werror -c "%SRC%" -o "%OBJ%"
if errorlevel 1 exit /b 1
ld.lld -nostdlib -z max-page-size=0x1000 -T "%LD%" "%OBJ%" -o "%OUT%"
if errorlevel 1 exit /b 1
for /f "usebackq delims=" %%H in (`powershell -NoProfile -Command "(Get-FileHash -LiteralPath '%OUT%' -Algorithm SHA256).Hash.ToLowerInvariant()"`) do set "HASH=%%H"
>"%ROOT%BUILD_LOCAL.txt" echo TaktVibes Community Kernel 0.1.0 Build 0001
>>"%ROOT%BUILD_LOCAL.txt" echo Local ELF SHA-256: !HASH!
>>"%ROOT%BUILD_LOCAL.txt" echo Hardware status: NOT INHERITED - test this exact local hash separately
>>"%ROOT%BUILD_LOCAL.txt" echo Official status: NO unless CER + detached signature + release gate pass
 echo BUILD PASS: %OUT%
 echo SHA-256: !HASH!
