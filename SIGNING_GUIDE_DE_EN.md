# TaktVibes Community Kernel – Signieranleitung / Signing Guide

**Projekt:** TaktVibes Community Kernel  
**Zweck / Purpose:** Signieren und Prüfen von `release/TaktVibes_Community_Kernel.elf` mit einer detached CMS/PKCS#7-Signatur.  
**Plattform / Platform:** Windows PowerShell / Windows 10/11

---

# DE – Deutsche Anleitung

## 1. Was wird signiert?

Signiert wird exakt die fertige Release-Datei:

```text
release\TaktVibes_Community_Kernel.elf
```

Die Signatur wird **nicht in die ELF eingebettet**. Es wird eine separate detached Signatur erzeugt:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

Das öffentliche Kernel-Zertifikat liegt im Repository als:

```text
cert\TaktVibes_Community_Kernel.cer
```

Der private Schlüssel befindet sich in einer `.pfx`-Datei und bleibt **außerhalb des Repositorys**.

---

## 2. Wichtige Sicherheitsregel

Folgende Dateien dürfen **niemals** in GitHub oder in das öffentliche Projekt kopiert werden:

```text
*.pfx
*.p12
*.pvk
*.key
private *.pem
Passwortdateien
sonstiges privates Schlüsselmaterial
```

Ins Repository gehören nur:

```text
TaktVibes_Community_Kernel.cer
TaktVibes_Community_Kernel.elf
TaktVibes_Community_Kernel.elf.p7s
SHA256SUMS.txt
```

Das CER enthält nur den öffentlichen Teil des Zertifikats und darf veröffentlicht werden.

---

## 3. Voraussetzungen

Du benötigst:

1. den fertigen Community-Kernel-Ordner,
2. die zu signierende `release\TaktVibes_Community_Kernel.elf`,
3. ein **kernel-spezifisches** Zertifikat,
4. die dazugehörige private `.pfx`-Datei,
5. das öffentliche CER:

```text
cert\TaktVibes_Community_Kernel.cer
```

Das TaktBoot-Community-Zertifikat darf nicht einfach in ein Kernel-Zertifikat umbenannt werden. Der Kernel benötigt seine eigene Zertifikatsidentität.

---

## 4. Optional: Kernel-Zertifikat neu erstellen

Diesen Abschnitt nur verwenden, wenn noch kein eigenes Kernel-Zertifikat existiert.

PowerShell **als normaler Benutzer** öffnen und ausführen:

```powershell
$cert = New-SelfSignedCertificate `
  -Type CodeSigningCert `
  -Subject "CN=TaktVibes Community Kernel" `
  -CertStoreLocation "Cert:\CurrentUser\My" `
  -KeyAlgorithm RSA `
  -KeyLength 3072 `
  -HashAlgorithm SHA256 `
  -KeyExportPolicy Exportable
```

Danach ein starkes PFX-Passwort setzen:

```powershell
$pwd = Read-Host "PFX password" -AsSecureString
```

Private PFX exportieren, zum Beispiel in einen **privaten Ordner außerhalb des Git-Repositories**:

```powershell
Export-PfxCertificate `
  -Cert $cert `
  -FilePath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx" `
  -Password $pwd
```

Öffentliches CER direkt in den Projektordner exportieren:

```powershell
Export-Certificate `
  -Cert $cert `
  -FilePath ".\cert\TaktVibes_Community_Kernel.cer"
```

Danach prüfen:

```text
PFX  -> privat, NICHT GitHub
CER  -> öffentlich, darf in GitHub
```

---

## 5. Fingerprint des CER prüfen

Im Projektordner ausführen:

```cmd
cert\fingerprint_sha256.cmd
```

Der SHA-256-Fingerprint sollte bei offiziellen Veröffentlichungen dokumentiert werden.

---

## 6. SHA-256 der ELF prüfen

Vor dem Signieren:

```cmd
verify_hash.cmd
```

Erwartet wird am Ende:

```text
HASH VERIFIED
```

Wenn `HASH MISMATCH` erscheint, **nicht signieren**. Zuerst `SHA256SUMS.txt` und die exakte Release-ELF prüfen.

---

## 7. TaktVibes_Community_Kernel.elf signieren

PowerShell im Projektordner öffnen.

Beispiel:

```powershell
.\sign_release.ps1 -PfxPath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx"
```

Das Skript fragt das PFX-Passwort ab.

Bei Erfolg entsteht:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

Erwartete Ausgabe:

```text
Detached signature written: ...\release\TaktVibes_Community_Kernel.elf.p7s
Private key was not copied into the repository.
```

Das Skript signiert standardmäßig:

```text
release\TaktVibes_Community_Kernel.elf
```

und schreibt standardmäßig:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

---

## 8. Signatur prüfen

Danach ausführen:

```powershell
.\verify_signature.ps1
```

Das Prüfsystem verwendet:

```text
release\TaktVibes_Community_Kernel.elf
release\TaktVibes_Community_Kernel.elf.p7s
cert\TaktVibes_Community_Kernel.cer
```

Bei Erfolg erscheint:

```text
SIGNATURE VERIFIED
Subject: ...
Thumbprint: ...
```

Die Prüfung bestätigt zwei Dinge:

1. die detached Signatur ist kryptografisch gültig,
2. der verwendete Signierer entspricht exakt dem Kernel-CER im Ordner `cert`.

---

## 9. Vollständigen Official-Check ausführen

Zum Abschluss:

```cmd
pre_release_check.cmd
```

Das Skript prüft unter anderem:

- kein privates Schlüsselmaterial im Projekt,
- Kernel-CER vorhanden,
- detached Signatur vorhanden,
- SHA-256 stimmt,
- Signatur ist gültig,
- Signierer entspricht dem Kernel-CER.

Bei erfolgreicher Kryptoprüfung erscheint:

```text
OFFICIAL CRYPTO CHECK PASS
```

**Wichtig:** Dieser Check allein macht einen Build noch nicht automatisch zum offiziellen Release. Zusätzlich müssen die projektintern vorgesehenen Build-, Runtime- und Hardware-Freigaben für exakt diesen Build erfüllt sein.

---

## 10. Was kommt anschließend in GitHub?

Öffentlich hochladen:

```text
cert\TaktVibes_Community_Kernel.cer
release\TaktVibes_Community_Kernel.elf
release\TaktVibes_Community_Kernel.elf.p7s
SHA256SUMS.txt
```

Zusätzlich gehören die normalen Source-, README-, Policy- und Builddateien des Projekts dazu.

Nicht hochladen:

```text
TaktVibes_Community_Kernel.pfx
PFX-Passwort
private Schlüssel
private Backup-Schlüssel
```

---

## 11. Nach jeder Änderung neu signieren

Eine Signatur gilt nur für **genau die Bytes**, die signiert wurden.

Wenn `TaktVibes_Community_Kernel.elf` neu gebaut oder auch nur um ein Byte verändert wird:

```text
alte Signatur nicht mehr verwenden
→ neuen SHA-256 erzeugen/dokumentieren
→ ELF neu signieren
→ Signatur erneut prüfen
→ Official-Check erneut ausführen
```

Eine Signatur von Build `0001` darf nicht einfach für Build `0002` übernommen werden.

---

## 12. Empfohlene Reihenfolge für einen offiziellen Build

```text
Source fertig
→ eindeutige Version + neue fortlaufende Buildnummer
→ Build erzeugen
→ Hardware-/Runtime-Test des exakten Builds
→ SHA-256 prüfen/dokumentieren
→ TaktVibes_Community_Kernel.elf mit privatem Kernel-PFX signieren
→ TaktVibes_Community_Kernel.elf.p7s erzeugen
→ verify_signature.ps1
→ pre_release_check.cmd
→ erst danach als Official veröffentlichen
```

---

# EN – English Guide

## 1. What is signed?

The exact finished release binary is signed:

```text
release\TaktVibes_Community_Kernel.elf
```

The signature is **not embedded into the ELF**. A separate detached signature is created:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

The public kernel certificate is stored in the repository as:

```text
cert\TaktVibes_Community_Kernel.cer
```

The private key is stored in a `.pfx` file and must remain **outside the repository**.

---

## 2. Important security rule

Never copy any of the following files into GitHub or the public project:

```text
*.pfx
*.p12
*.pvk
*.key
private *.pem
password files
any other private key material
```

Only public material belongs in the repository:

```text
TaktVibes_Community_Kernel.cer
TaktVibes_Community_Kernel.elf
TaktVibes_Community_Kernel.elf.p7s
SHA256SUMS.txt
```

The CER contains only the public certificate information and may be published.

---

## 3. Requirements

You need:

1. the finished Community Kernel project folder,
2. the exact `release\TaktVibes_Community_Kernel.elf` to be signed,
3. a **kernel-specific** certificate,
4. the matching private `.pfx` file,
5. the public certificate:

```text
cert\TaktVibes_Community_Kernel.cer
```

The TaktBoot Community certificate must not simply be renamed and used as the kernel certificate. The kernel requires its own certificate identity.

---

## 4. Optional: Create a new kernel certificate

Use this section only if no dedicated kernel certificate exists yet.

Open Windows PowerShell and run:

```powershell
$cert = New-SelfSignedCertificate `
  -Type CodeSigningCert `
  -Subject "CN=TaktVibes Community Kernel" `
  -CertStoreLocation "Cert:\CurrentUser\My" `
  -KeyAlgorithm RSA `
  -KeyLength 3072 `
  -HashAlgorithm SHA256 `
  -KeyExportPolicy Exportable
```

Create a strong PFX password:

```powershell
$pwd = Read-Host "PFX password" -AsSecureString
```

Export the private PFX to a **private location outside the Git repository**:

```powershell
Export-PfxCertificate `
  -Cert $cert `
  -FilePath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx" `
  -Password $pwd
```

Export the public CER into the project:

```powershell
Export-Certificate `
  -Cert $cert `
  -FilePath ".\cert\TaktVibes_Community_Kernel.cer"
```

Remember:

```text
PFX -> private, NEVER GitHub
CER -> public, may be committed to GitHub
```

---

## 5. Check the CER fingerprint

From the project folder run:

```cmd
cert\fingerprint_sha256.cmd
```

The SHA-256 certificate fingerprint should be documented for official releases.

---

## 6. Verify the ELF SHA-256 hash

Before signing run:

```cmd
verify_hash.cmd
```

Expected result:

```text
HASH VERIFIED
```

If you see `HASH MISMATCH`, **do not sign the file**. First verify `SHA256SUMS.txt` and the exact release ELF.

---

## 7. Sign TaktVibes_Community_Kernel.elf

Open PowerShell in the project folder.

Example:

```powershell
.\sign_release.ps1 -PfxPath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx"
```

The script prompts for the PFX password.

On success it creates:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

Expected output:

```text
Detached signature written: ...\release\TaktVibes_Community_Kernel.elf.p7s
Private key was not copied into the repository.
```

By default the script signs:

```text
release\TaktVibes_Community_Kernel.elf
```

and writes:

```text
release\TaktVibes_Community_Kernel.elf.p7s
```

---

## 8. Verify the signature

Run:

```powershell
.\verify_signature.ps1
```

The verification uses:

```text
release\TaktVibes_Community_Kernel.elf
release\TaktVibes_Community_Kernel.elf.p7s
cert\TaktVibes_Community_Kernel.cer
```

On success you should see:

```text
SIGNATURE VERIFIED
Subject: ...
Thumbprint: ...
```

The check confirms both:

1. the detached signature is cryptographically valid,
2. the signer matches the exact kernel CER stored in the `cert` directory.

---

## 9. Run the complete Official crypto check

Finally run:

```cmd
pre_release_check.cmd
```

The script checks, among other things:

- no private key material exists inside the project,
- the kernel CER is present,
- the detached signature exists,
- the SHA-256 hash matches,
- the signature is valid,
- the signer matches the kernel CER.

Successful result:

```text
OFFICIAL CRYPTO CHECK PASS
```

**Important:** This cryptographic check alone does not automatically make a build an Official release. The exact build must also pass the required project build, runtime, and hardware release gates.

---

## 10. What should be published on GitHub?

Public files include:

```text
cert\TaktVibes_Community_Kernel.cer
release\TaktVibes_Community_Kernel.elf
release\TaktVibes_Community_Kernel.elf.p7s
SHA256SUMS.txt
```

The normal project source, README, policy, and build files are published as well.

Never publish:

```text
TaktVibes_Community_Kernel.pfx
PFX password
private keys
private backup keys
```

---

## 11. Re-sign after every binary change

A digital signature is valid only for **the exact bytes that were signed**.

Whenever `TaktVibes_Community_Kernel.elf` is rebuilt or changed, even by one byte:

```text
do not reuse the old signature
→ calculate/document the new SHA-256
→ sign the ELF again
→ verify the new signature
→ run the Official check again
```

A signature created for Build `0001` must never simply be reused for Build `0002`.

---

## 12. Recommended Official build sequence

```text
finish source
→ assign unique version + new sequential build number
→ build
→ hardware/runtime-test the exact build
→ verify/document SHA-256
→ sign TaktVibes_Community_Kernel.elf with the private kernel PFX
→ create TaktVibes_Community_Kernel.elf.p7s
→ run verify_signature.ps1
→ run pre_release_check.cmd
→ only then publish as Official
```

---

# Kurzfassung / Quick Reference

## DE

```powershell
# 1. Hash prüfen
.\verify_hash.cmd

# 2. ELF signieren
.\sign_release.ps1 -PfxPath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx"

# 3. Signatur prüfen
.\verify_signature.ps1

# 4. Official-Check
.\pre_release_check.cmd
```

## EN

```powershell
# 1. Verify hash
.\verify_hash.cmd

# 2. Sign ELF
.\sign_release.ps1 -PfxPath "D:\PRIVATE_KEYS\TaktVibes_Community_Kernel.pfx"

# 3. Verify signature
.\verify_signature.ps1

# 4. Run Official check
.\pre_release_check.cmd
```

---

**Grundregel / Golden rule:**  
**CER public – PFX private. Never publish the private key.**
