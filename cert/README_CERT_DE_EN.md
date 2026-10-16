# Kernel Certificate / Kernel-Zertifikat

## DE

Erwartete oeffentliche Datei:

`TaktVibes_Community_Kernel.cer`

Dieser Build enthaelt **noch kein kernel-spezifisches CER**. Das vorhandene TaktBoot-Community-Zertifikat wurde bewusst nicht kopiert oder umbenannt, weil dessen Zertifikatsidentitaet `TaktVibes TaktBoot Community` lautet.

Ein Build darf erst als `Official` freigegeben werden, wenn das echte kernel-spezifische CER vorhanden ist und die detached Signatur des ELF dagegen erfolgreich geprueft wurde.

Niemals hier ablegen: `.pfx`, `.p12`, `.pvk`, `.key`, private `.pem`, Passwortdateien oder anderes privates Schluesselmaterial.

## EN

Expected public file: `TaktVibes_Community_Kernel.cer`.

This package does not yet include a kernel-specific CER. The existing TaktBoot Community certificate was intentionally not copied or renamed because its certificate identity is `TaktVibes TaktBoot Community`.

A build may only be released as `Official` after the real kernel-specific CER is present and the detached ELF signature verifies against it. Private key material must never be stored here.
