# TaktBoot Community EFI – Freeze Policy / Einfrierungsrichtlinie

## Deutsch

### Eigenständiger Community-EFI

Der **TaktBoot Community EFI** ist ein **eigenständiges EFI-/Boot-Projekt**, das speziell dafür vorgesehen ist, den **TaktVibes Community Kernel** zuverlässig zu starten.

Er ist nicht der Kernel selbst und soll auch nicht zu einem zweiten Kernel werden. Seine Aufgabe ist bewusst klar begrenzt:

- UEFI starten,
- den Community-Kernel als ELF laden,
- die notwendigen Boot-/Übergabedaten vorbereiten,
- sauber in den Community-Kernel springen.

### Warum der EFI eingefroren bleibt

Der aktuelle funktionierende Stand bleibt als **stabile Referenzbasis eingefroren**, damit die Kernel-Entwicklung auf einem verlässlichen Boot-Unterbau stattfinden kann.

Das bedeutet: Wer am Community Kernel arbeitet, soll sich darauf verlassen können, dass der Bootweg nicht ständig verändert wird.

Der Grundgedanke ist:

**Der EFI soll stabil laufen, damit man den Kernel entwickeln kann.**

Die eigentliche Weiterentwicklung findet deshalb hauptsächlich im **separaten TaktVibes Community Kernel** statt.

### Grundsatz

Der Community-EFI soll bewusst:

- klein,
- stabil,
- nachvollziehbar,
- wartungsarm
- und möglichst unverändert

bleiben.

Er ist die feste Startplattform für die Community-Kernel-Entwicklung.

### Was „eingefroren“ bedeutet

„Eingefroren“ bedeutet:

- keine normalen Funktionsänderungen ohne konkreten technischen Grund,
- keine Erweiterung nur aus Komfort- oder Experimentiergründen,
- keine Verlagerung von Kernel-Funktionen in den EFI,
- keine stillen Änderungen an Loader, Handoff oder Bootpfad,
- der bestätigte funktionierende Stand bleibt die Referenz.

### Änderungen bleiben ausdrücklich möglich

TaktVibes behält sich ausdrücklich vor, den EFI später anzupassen, wenn dies technisch notwendig oder sinnvoll wird.

Mögliche Gründe sind zum Beispiel:

- Fehlerkorrekturen,
- Sicherheitsprobleme,
- notwendige Kompatibilitätsanpassungen,
- Änderungen an UEFI- oder Hardware-Anforderungen,
- notwendige Anpassungen des Kernel-Handoffs,
- Verbesserungen, die den stabilen Bootpfad nicht unnötig verkomplizieren.

Eine solche Änderung soll gezielt erfolgen und nicht den Grundsatz aufheben, dass der EFI als stabile Plattform für die Kernel-Entwicklung dient.

### Projekttrennung

Der **TaktBoot Community EFI** und der **TaktVibes Community Kernel** bleiben zwei getrennte Projekte.

Der EFI stellt den stabilen Boot- und Übergabepfad bereit.  
Der Kernel ist der Bereich, in dem die eigentliche Betriebssystementwicklung stattfindet.

Kurz gesagt:

**Eigenständiger EFI. Stabiler Bootpfad. Freie Kernel-Entwicklung.**

---

## English

### Standalone Community EFI

**TaktBoot Community EFI** is a **standalone EFI/boot project** specifically intended to start the **TaktVibes Community Kernel** reliably.

It is not the kernel itself and is not intended to become a second kernel. Its responsibilities are deliberately limited to:

- starting through UEFI,
- loading the Community Kernel ELF,
- preparing the required boot/handoff information,
- transferring control cleanly to the Community Kernel.

### Why the EFI remains frozen

The current working state is kept as a **frozen, stable reference baseline** so that kernel development can take place on top of a reliable boot foundation.

This means Community Kernel developers should be able to rely on the boot path without it changing constantly.

The core idea is:

**The EFI should remain stable so the kernel can be developed.**

Further development should therefore happen primarily in the **separate TaktVibes Community Kernel** project.

### Principle

The Community EFI is intentionally kept:

- small,
- stable,
- understandable,
- low-maintenance,
- and as unchanged as reasonably possible.

It serves as the fixed startup platform for Community Kernel development.

### What “frozen” means

“Frozen” means:

- no routine feature changes without a concrete technical reason,
- no extensions added only for convenience or experimentation,
- no migration of kernel responsibilities into the EFI,
- no silent changes to the loader, handoff, or boot path,
- the confirmed working state remains the reference baseline.

### Changes remain explicitly possible

TaktVibes explicitly reserves the right to adapt the EFI later if this becomes technically necessary or useful.

Possible reasons include:

- bug fixes,
- security issues,
- required compatibility changes,
- changes in UEFI or hardware requirements,
- necessary kernel-handoff changes,
- improvements that do not unnecessarily complicate the stable boot path.

Any such change should be deliberate and should not remove the main principle that the EFI serves as a stable platform for kernel development.

### Project separation

**TaktBoot Community EFI** and **TaktVibes Community Kernel** remain two separate projects.

The EFI provides the stable boot and handoff path.  
The kernel is where the actual operating-system development takes place.

In short:

**Standalone EFI. Stable boot path. Open kernel development.**
