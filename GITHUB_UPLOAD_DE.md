# GitHub Upload - TaktVibes Community Kernel 0.1.0 Build 0001

Repository-Vorschlag: `TaktVibes-Community-Kernel`

Beschreibung: `Educational x86_64 ELF64 kernel by TaktVibes - sequential builds, hardware-gated releases, SHA-256 and certificate-backed detached signatures.`

## Vor Upload

- keine PFX/P12/PVK/KEY/privaten PEM-Dateien enthalten,
- `release/TaktVibes_Community_Kernel.elf` und `SHA256SUMS.txt` vorhanden,
- README und Fork-/Official-Regeln pruefen,
- Kernel-spezifisches CER nur dann unter `cert/` ablegen, wenn es wirklich fuer den Community Kernel ausgestellt wurde.

## Commit-Vorschlag

`TaktVibes Community Kernel 0.1.0 Build 0001 - initial kernel development baseline`

## Wichtig

Build 0001 darf auf GitHub als Community-/Learning-Stand veroeffentlicht werden. Als `Official` darf er erst bezeichnet werden, wenn das kernel-spezifische CER und die dazu passende detached Signatur vorliegen und `pre_release_check.cmd` besteht.
