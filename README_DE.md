# TaktVibes Community Kernel 0.1.0 - Build 0001

Eigenstaendiges oeffentliches Lern-/Community-Kernelprojekt von TaktVibes. Dieses Repository enthaelt **nur den Kernel**; TaktBoot/EFI bleibt ein getrenntes Projekt.

## Identitaet

- Version: `0.1.0`
- Build: `0001`
- Datum: `2026-10-16`
- Vendor: `TaktVibes`
- Channel: `Community / Learning`
- Architektur: `x86_64 / ELF64`
- Link-/Ladebasis: `0x01080000`
- EntryPoint: `0x01080000`

Buildnummern werden fortlaufend vergeben und niemals wiederverwendet. Ein bestaetigter Build wird nicht still ueberschrieben.

## Stand Build 0001

Die Datei `release/TaktVibes_Community_Kernel.elf` ist die unveraenderte Community-ELF aus dem Hardwaretest mit TaktBoot Community Build 0005. Fuer **genau diesen ELF-Hash** wurde der Kernelstart auf echter Hardware vom Nutzer bestaetigt.

SHA-256:

`07ff9d7922d24ef0988133d841fd529798a8ab3a9fe5ef3e2f4470e787b7ddd0`

Der Quellcode zeigt beim erfolgreichen Entry ueber den Framebuffer drei sichtbare Farbbalken und geht danach in eine `cli; hlt`-Schleife.

## Bauen

Das Projekt verwendet fuer den Kernel `clang` und `ld.lld`, weil ein freistehendes ELF64 erzeugt wird.

1. LLVM/Clang installieren.
2. `build.cmd` ausfuehren.
3. Ergebnis: `build\KERNEL\TaktVibes_Community_Kernel.elf`
4. `verify_hash.cmd build\KERNEL\TaktVibes_Community_Kernel.elf` prueft den erzeugten Hash.

Ein neu gebautes ELF erbt **nicht automatisch** den Hardware-PASS des Release-ELF.

## Official / Zertifikat

Ein Build darf nur als **Official** bezeichnet werden, wenn alle folgenden Punkte erfuellt sind:

1. fortlaufende, nicht wiederverwendete Buildnummer,
2. SHA-256 dokumentiert,
3. das kernel-spezifische oeffentliche Zertifikat `cert\TaktVibes_Community_Kernel.cer` liegt vor,
4. eine gueltige detached CMS-Signatur `TaktVibes_Community_Kernel.elf.p7s` wurde mit dem zu diesem CER gehoerenden privaten Schluessel erzeugt,
5. `verify_signature.ps1` bestaetigt Signatur und Zertifikatsidentitaet,
6. der konkrete Build wurde auf Hardware getestet und freigegeben.

**Ein CER allein ist noch kein Signaturbeweis.** Das CER ist die oeffentliche Pruefidentitaet; die Signatur muss zum privaten Schluessel dieses Zertifikats passen.

Private Schluessel, `.pfx`, `.p12`, `.key` oder Passwortdateien duerfen niemals in dieses Repository.

## Forks / Modified Builds

Forks sind ausdruecklich erlaubt, muessen aber klar als `Fork` oder `Modified` gekennzeichnet werden. Ein Fork darf `TaktVibes Official` nicht als eigenen Status verwenden. Er soll den Ausgangsstand nennen, z. B. `Based on TaktVibes Community Kernel 0.1.0 Build 0001`, und eine eigene Buildfolge fuehren.

Weitere Regeln: `FORK_POLICY_DE_EN.md` und `OFFICIAL_POLICY_DE_EN.md`.


## Autoren & Danksagung

Gemeinsam entwickelt von:

- **Meister 1 / TaktVibes** — Projektleitung, Hardwaretests, Architekturentscheidungen und gemeinsame Entwicklung
- **Meister 2 / ChatGPT by OpenAI** — technische Analyse, Code-/Build-Unterstuetzung, Dokumentation und gemeinsame Fehlersuche

Build-/Entwicklungstag: `2026-10-16`  
Credits-/GitHub-Paket finalisiert: `2026-10-16 12:55 CEST (Europe/Berlin)`

**Besonderer Dank an Google** und die im Entwicklungsprozess genutzten Google-/KI-Quellen fuer hilfreiche externe Perspektiven, Gegenpruefungen und Denkanstoesse. Dies ist keine offizielle Unterstuetzung, Zertifizierung oder Freigabe durch Google.

Mehr dazu: `AUTHORS_AND_CREDITS_DE_EN.md`.

