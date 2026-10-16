param(
  [Parameter(Mandatory=$true)][string]$PfxPath,
  [string]$File = "$PSScriptRoot\release\TaktVibes_Community_Kernel.elf",
  [string]$OutFile = "$PSScriptRoot\release\TaktVibes_Community_Kernel.elf.p7s"
)
if (-not (Test-Path -LiteralPath $PfxPath)) { throw "PFX not found: $PfxPath" }
if (-not (Test-Path -LiteralPath $File)) { throw "ELF not found: $File" }
$pwd = Read-Host "PFX password" -AsSecureString
Add-Type -AssemblyName System.Security
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($PfxPath, $pwd)
$content = New-Object System.Security.Cryptography.Pkcs.ContentInfo (,[IO.File]::ReadAllBytes($File))
$cms = New-Object System.Security.Cryptography.Pkcs.SignedCms($content, $true)
$signer = New-Object System.Security.Cryptography.Pkcs.CmsSigner($cert)
$cms.ComputeSignature($signer)
[IO.File]::WriteAllBytes($OutFile, $cms.Encode())
Write-Host "Detached signature written: $OutFile"
Write-Host "Private key was not copied into the repository."
