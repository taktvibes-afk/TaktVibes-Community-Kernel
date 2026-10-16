# TaktVibes Community Kernel 0.1.0 - Build 0001

Standalone public learning/community kernel project by TaktVibes. This repository contains **the kernel only**; TaktBoot/EFI remains a separate project.

## Identity
- Version: `0.1.0`
- Build: `0001`
- Date: `2026-10-16`
- Vendor: `TaktVibes`
- Channel: `Community / Learning`
- Architecture: `x86_64 / ELF64`
- Link/load base: `0x01080000`
- Entry point: `0x01080000`

Build numbers are sequential and never reused. Confirmed builds are never silently overwritten.

## Build 0001 state
`release/TaktVibes_Community_Kernel.elf` is the unchanged Community ELF used in the hardware test with TaktBoot Community Build 0005. Hardware entry was confirmed for **this exact ELF hash**:

`07ff9d7922d24ef0988133d841fd529798a8ab3a9fe5ef3e2f4470e787b7ddd0`

## Official / certificate
A build may be labelled **Official** only if the kernel-specific public certificate `cert/TaktVibes_Community_Kernel.cer` is present, a detached CMS signature for the ELF verifies against that certificate, the SHA-256 is documented, the build number is unique, and that exact build has passed the required hardware test.

A CER by itself is not proof of a signature; it is the public verification identity. Private keys must never be stored in this repository.

## Forks
Forks and modified builds must identify themselves as `Fork` or `Modified`, state the official build they were based on, and maintain their own build-number sequence. They must not present themselves as `TaktVibes Official`.


## Authors & credits

Jointly developed by:

- **Meister 1 / TaktVibes** — project lead, hardware testing, architecture decisions, and joint development
- **Meister 2 / ChatGPT by OpenAI** — technical analysis, code/build assistance, documentation, and joint debugging

Build/development date: `2026-10-16`  
Credits/GitHub package finalized: `2026-10-16 12:55 CEST (Europe/Berlin)`

**Special thanks to Google** and the Google/AI sources used during development for useful external perspectives, cross-checks, and ideas. This does not imply official endorsement, certification, or approval by Google.

See `AUTHORS_AND_CREDITS_DE_EN.md` for details.

