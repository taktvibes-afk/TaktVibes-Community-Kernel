# Fork / Modified Policy

## DE

Forks sind erlaubt. Sie muessen aber eindeutig getrennt bleiben.

Empfohlenes Schema:

```text
Upstream: TaktVibes Community Kernel 0.1.0 Build 0001
Channel: Fork / Modified
Fork Vendor: <Name>
Fork Build: 0001, 0002, 0003 ...
```

Regeln:
- keine Nutzung von `Official` fuer veraenderte Builds,
- keine Wiederverwendung der offiziellen TaktVibes-Buildnummer als eigene Identitaet,
- Upstream-Basis nennen,
- eigene fortlaufende Fork-Buildnummern fuehren,
- eigenes Zertifikat verwenden, wenn der Fork signiert wird,
- TaktVibes-CER nicht als Zertifikat des Forks ausgeben.

## EN

Forks are allowed but must remain clearly identified. Modified builds must use a `Fork / Modified` channel, name their upstream base, keep their own sequential fork build numbers, and use their own certificate if signed. They must not present themselves as `TaktVibes Official`.
