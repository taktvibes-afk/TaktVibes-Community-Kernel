param(
  [string]$File = "$PSScriptRoot\release\TaktVibes_Community_Kernel.elf",
  [string]$Signature = "$PSScriptRoot\release\TaktVibes_Community_Kernel.elf.p7s",
  [string]$Cer = "$PSScriptRoot\cert\TaktVibes_Community_Kernel.cer"
)
foreach ($p in @($File,$Signature,$Cer)) { if (-not (Test-Path -LiteralPath $p)) { throw "Missing: $p" } }
Add-Type -AssemblyName System.Security
$expected = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($Cer)
$content = New-Object System.Security.Cryptography.Pkcs.ContentInfo (,[IO.File]::ReadAllBytes($File))
$cms = New-Object System.Security.Cryptography.Pkcs.SignedCms($content, $true)
$cms.Decode([IO.File]::ReadAllBytes($Signature))
$cms.CheckSignature($true)
if ($cms.SignerInfos.Count -ne 1) { throw "Expected exactly one signer." }
$actual = $cms.SignerInfos[0].Certificate
if ($actual.Thumbprint -ne $expected.Thumbprint) { throw "Signature is valid but signer does not match kernel CER." }
Write-Host "SIGNATURE VERIFIED"
Write-Host ("Subject: " + $actual.Subject)
Write-Host ("Thumbprint: " + $actual.Thumbprint)
