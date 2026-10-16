# Release Notes / Aenderungen

## 0.1.0 Build 0001 - 2026-10-16

### DE
- erster eigenstaendiger Community-Kernel-GitHub-Stand
- Kernel-only: kein EFI/TaktBoot im Repository
- Link-/Ladebasis und Entry `0x01080000`
- Hardware-Entry fuer das enthaltene Release-ELF bestaetigt
- fortlaufende Buildnummern eingefuehrt
- SHA-256-Pruefung
- Official-vs-Fork-Regel
- kernel-spezifisches CER als Voraussetzung fuer Official definiert
- detached CMS-Signatur als Authentizitaetsnachweis vorbereitet
- private Schluessel bleiben ausserhalb des Repositorys

### EN
- first standalone Community Kernel GitHub baseline
- kernel-only repository, no EFI/TaktBoot
- load/link base and entry at `0x01080000`
- hardware entry confirmed for the included release ELF
- sequential build IDs introduced
- SHA-256 verification
- Official vs Fork policy
- kernel-specific CER required for Official status
- detached CMS signature workflow prepared
- private keys remain outside the repository

---

## Documentation update / Dokumentationsnachtrag — 2026-10-16 12:55 CEST (Europe/Berlin)

- Autoren-/Credits-Angaben ergaenzt / author and credit information added.
- Besonderer Dank an Google ergaenzt / special thanks to Google added.
- Kein Binary- oder Source-Change am hardwaregetesteten Release-ELF / no binary or source change to the hardware-tested release ELF.
