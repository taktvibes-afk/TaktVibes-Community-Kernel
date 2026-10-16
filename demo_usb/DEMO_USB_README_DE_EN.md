# Demo USB / Hardware Test Demonstration

## Deutsch

Dieser Ordner zeigt den USB-Stick-Aufbau, der für den Hardwaretest verwendet wurde.

> Hinweis: Das offizielle Kernel-Artefakt im Repository heißt `TaktVibes_Community_Kernel.elf`. Im Demo-USB bleibt dieselbe Binärdatei unter dem Bootnamen `COMMUNITY.ELF`, weil TaktBoot Community Build 0005 genau diesen Pfad `\KERNEL\COMMUNITY.ELF` lädt. Die Dateien sind inhaltlich identisch; nur der Dateiname für den Bootpfad unterscheidet sich.

```text
demo_usb/
├── EFI/
│   └── BOOT/
│       └── BOOTX64.EFI
└── KERNEL/
    └── COMMUNITY.ELF
```

### Zweck

Der Ordner dient nur als **Demonstration des getesteten Boot-Aufbaus**.

- `BOOTX64.EFI` startet über UEFI.
- `COMMUNITY.ELF` wird vom Community-EFI geladen.
- Der Aufbau wurde auf echter Hardware getestet.
- Die eigentliche Entwicklung erfolgt weiterhin aus den normalen Source-/Build-Ordnern.
- Dieser Demo-Ordner ist **keine Buildquelle** und soll nicht als Arbeitsverzeichnis verwendet werden.


### Entwicklungshintergrund

In diesen Community-Build sind bewusst **Erfahrungen und technische Erkenntnisse aus unserer internen TKV.OS-/TaktBoot-Entwicklung** eingeflossen.

Besonders die frühere Arbeit an der ELF64-Ladestrecke, der Prüfung des vollständigen `PT_LOAD`-Adressbereichs und der UEFI-Memory-Map hat geholfen, den Community-Handoff sauber und nachvollziehbar aufzubauen.

Dabei gilt weiterhin die Projekttrennung:

- TKV.OS / interner TaktBoot bleibt ein eigenes Projekt.
- TaktBoot Community / Community Kernel bleibt ein eigenes Lern- und Community-Projekt.
- Es wird nicht behauptet, dass interner TKV.OS-Code unverändert übernommen wurde.
- Übernommen wurden vor allem **Erfahrungen, Fehleranalysen und bewährte Architekturprinzipien** aus der gemeinsamen Entwicklung.

So zeigt der Demo-USB nicht nur, dass der Community-Build auf echter Hardware funktioniert, sondern auch, wie Erkenntnisse aus einer realen Betriebssystementwicklung in ein verständliches Community-Projekt einfließen können.


### USB-Stick vorbereiten

1. USB-Stick mit einem UEFI-lesbaren Dateisystem vorbereiten.
2. Den Inhalt dieses Ordners in das Stammverzeichnis des USB-Sticks kopieren.
3. Der Stick muss danach mindestens enthalten:

```text
\EFI\BOOT\BOOTX64.EFI
\KERNEL\COMMUNITY.ELF
```

4. Rechner im UEFI-Modus vom USB-Stick starten.

### Wichtig

Keine privaten Zertifikate, PFX-Dateien oder privaten Schlüssel in diesen Demo-Ordner oder auf GitHub legen.

---

## English

This folder shows the USB stick layout used for the hardware test.

> Note: The canonical kernel artifact in the repository is named `TaktVibes_Community_Kernel.elf`. In the demo USB layout, the same binary remains named `COMMUNITY.ELF` because TaktBoot Community Build 0005 loads exactly the path `\KERNEL\COMMUNITY.ELF`. The binaries are identical; only the boot-path filename differs.

```text
demo_usb/
├── EFI/
│   └── BOOT/
│       └── BOOTX64.EFI
└── KERNEL/
    └── COMMUNITY.ELF
```

### Purpose

This folder is only a **demonstration of the tested boot layout**.

- `BOOTX64.EFI` starts through UEFI.
- `COMMUNITY.ELF` is loaded by the Community EFI.
- This layout was tested on real hardware.
- Development still takes place in the normal source/build directories.
- This demo folder is **not a build source** and should not be used as a working directory.


### Development background

This Community build intentionally benefits from **experience and technical lessons learned during our internal TKV.OS / TaktBoot development**.

In particular, earlier work on the ELF64 loading path, validation of the complete `PT_LOAD` address range, and UEFI memory-map analysis helped us build a cleaner and more understandable Community handoff.

The projects still remain clearly separated:

- TKV.OS / internal TaktBoot remains its own project.
- TaktBoot Community / Community Kernel remains its own learning and community project.
- We do not claim that internal TKV.OS code was copied unchanged.
- What was carried over are mainly **experience, debugging lessons, and proven architectural principles** from the development work.

The demo USB therefore shows not only that the Community build works on real hardware, but also how lessons from real operating-system development can flow into an understandable community project.


### Prepare the USB stick

1. Prepare the USB stick with a UEFI-readable file system.
2. Copy the contents of this folder to the root of the USB stick.
3. The stick must contain at least:

```text
\EFI\BOOT\BOOTX64.EFI
\KERNEL\COMMUNITY.ELF
```

4. Boot the computer from the USB stick in UEFI mode.

### Important

Never place private certificates, PFX files, or private keys in this demo folder or on GitHub.
