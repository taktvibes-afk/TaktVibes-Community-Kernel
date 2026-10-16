# Official Build Policy / Regel fuer offizielle Builds

## DE

Ein Kernel-Build ist nur dann `TaktVibes Official`, wenn:

- Version und fortlaufende Buildnummer eindeutig sind,
- die Buildnummer nie zuvor fuer anderen Source verwendet wurde,
- SHA-256 des exakten Release-ELF dokumentiert ist,
- `cert/TaktVibes_Community_Kernel.cer` vorhanden ist,
- eine detached CMS-Signatur des exakten ELF vorhanden ist,
- `verify_signature.ps1` die Signatur gegen genau dieses CER bestaetigt,
- keine privaten Schluessel im Repository liegen,
- der konkrete Release-Build die vorgesehene Hardware-/Runtime-Freigabe erhalten hat.

Fehlt einer dieser Punkte, ist der Stand `Community`, `Development`, `Candidate`, `Modified` oder `Fork` - aber nicht `Official`.

Das vorhandene TaktBoot-Community-CER darf nicht still als Kernel-Zertifikat umetikettiert werden. Ein Kernel-spezifisches CER ist erforderlich.

## EN

A kernel build is `TaktVibes Official` only when its version and sequential build number are unique, the exact release ELF hash is documented, the kernel-specific CER is present, a detached CMS signature verifies against that CER, no private key material is included, and the exact build has passed the required hardware/runtime release gate.

If any condition is missing, the build is not Official. The TaktBoot Community certificate must not be silently relabelled as a kernel certificate.
