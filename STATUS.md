# Status - TaktVibes Community Kernel 0.1.0 Build 0001

- SOURCE BASE: Community kernel from TaktBoot Community Build 0005 test kernel
- RELEASE ELF SHA-256: `07ff9d7922d24ef0988133d841fd529798a8ab3a9fe5ef3e2f4470e787b7ddd0`
- HARDWARE ENTRY TEST: PASS for this exact release ELF, confirmed by Meister 1 on 2026-10-16
- LOAD BASE / ENTRY: `0x01080000`
- BUILD NUMBER POLICY: sequential, never reuse
- FORK POLICY: forks must use Fork/Modified identity and their own sequence
- OFFICIAL STATUS: **NOT YET**
- OFFICIAL BLOCKER: kernel-specific `TaktVibes_Community_Kernel.cer` + matching detached CMS signature are not yet present
- PRIVATE KEY MATERIAL: must remain outside the repository

## Current certificate / signing status

- `cert/TaktVibes_Community_Kernel.cer`: PRESENT
- Certificate identity: `CN=TaktVibes Community Kernel`
- Private key: NOT included in this repository
- Detached release signature: NOT YET PRESENT
- Current release state: `Community / Learning - Hardware PASS - CER present - not yet Official`

Official status requires a valid detached signature for the exact release ELF in addition to the public kernel certificate.
