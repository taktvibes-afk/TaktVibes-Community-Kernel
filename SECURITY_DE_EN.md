# Security / Sicherheit

## DE

- SHA-256 sichert die Integritaetspruefung des konkreten ELF.
- Die detached CMS-Signatur prueft die Authentizitaet des konkreten ELF.
- Das oeffentliche CER darf ins Repository.
- Private PFX/P12/KEY/PVK/PEM-Dateien und Passwortdateien duerfen niemals ins Repository.
- `Official` setzt einen erfolgreichen Signaturabgleich mit dem kernel-spezifischen CER voraus.
- Buildnummern werden nicht wiederverwendet.
- Ein Hardware-PASS gilt nur fuer den exakt getesteten Hash.

## EN

- SHA-256 provides integrity verification for the exact ELF.
- The detached CMS signature provides authenticity verification for the exact ELF.
- The public CER may be stored in the repository.
- Private PFX/P12/KEY/PVK/PEM files and password files must never be stored in the repository.
- `Official` requires successful signature verification against the kernel-specific CER.
- Build numbers are never reused.
- Hardware PASS applies only to the exact tested hash.
