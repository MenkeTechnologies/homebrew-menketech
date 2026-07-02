```
 ███╗   ███╗███████╗███╗   ██╗██╗  ██╗███████╗████████╗███████╗ ██████╗██╗  ██╗
 ████╗ ████║██╔════╝████╗  ██║██║ ██╔╝██╔════╝╚══██╔══╝██╔════╝██╔════╝██║  ██║
 ██╔████╔██║█████╗  ██╔██╗ ██║█████╔╝ █████╗     ██║   █████╗  ██║     ███████║
 ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██╔═██╗ ██╔══╝     ██║   ██╔══╝  ██║     ██╔══██║
 ██║ ╚═╝ ██║███████╗██║ ╚████║██║  ██╗███████╗   ██║   ███████╗╚██████╗██║  ██║
 ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Formulas](https://img.shields.io/badge/formulas-16-cyan.svg)](Formula/)

### `[HOMEBREW TAP // ALL MENKETECHNOLOGIES CLI TOOLS // ONE \`brew tap\` AWAY]`

> *"`brew install stryke zshrs lsofrs awkrs iftoprs nmaprs temprs storageshower powerliners zpwrchrome-host` — done."*

Single tap that ships pre-built binaries for every CLI tool in the [MenkeTechnologies](https://github.com/MenkeTechnologies) family. Updated automatically by each tool's GitHub Actions `Release` workflow — when a `v*` (or `host-v*` for `zpwrchrome-host`) tag is pushed on `strykelang` / `zshrs` / `lsofrs` / `iftoprs` / `awkrs` / `nmaprs` / `temprs` / `storageshower` / `powerliners` / `zpwrchrome` / `zemacs` / `elisprs` / `vimlrs`, the formula here gets a fresh version + sha256 sums for every platform.

### [`MenkeTechnologies on GitHub`](https://github.com/MenkeTechnologies) &middot; [`strykelang`](https://github.com/MenkeTechnologies/strykelang) · [`zshrs`](https://github.com/MenkeTechnologies/zshrs) · [`MenkeTechnologiesMeta`](https://github.com/MenkeTechnologies/MenkeTechnologiesMeta)

---

## Table of Contents

- [\[0x00\] Quick Start](#0x00-quick-start)
- [\[0x01\] Formulas](#0x01-formulas)
- [\[0x02\] Platform Support](#0x02-platform-support)
- [\[0x03\] Auto-Update Mechanism](#0x03-auto-update-mechanism)
- [\[0xFF\] License](#0xff-license)

---

## [0x00] QUICK START

```bash
brew tap MenkeTechnologies/menketech
brew install stryke      # the language: stryke + s + st
brew install zshrs       # the shell: zshrs + zd
brew install zshrs-all   # full install: zshrs + zd + zshrs-recorder + zshrs-daemon (conflicts with zshrs)
brew install lsofrs      # rust lsof: lsofrs + lsf
brew install iftoprs     # rust iftop: iftoprs
brew install awkrs       # rust awk: awkrs + aw
brew install nmaprs      # rust nmap: nmaprs + nms
brew install temprs      # tempfile stack manager: temprs + tp
brew install storageshower # cyberpunk disk-usage TUI: storageshower
brew install powerliners # rust powerline port: powerline + powerline-daemon + powerline-config + powerline-render + powerline-lint
brew install zpwrchrome-host # native messaging host for the zpwrchrome Chrome extension: zpwrchrome-host
brew install zemacs      # modal text editor on the Helix engine: zemacs
brew install elisprs     # Emacs Lisp on the fusevm bytecode VM (AOT + rkyv cache): elisp
brew install vimlrs      # rust Vimscript (VimL) interpreter: vimlrs

# or install everything in one go
brew install stryke zshrs lsofrs iftoprs awkrs nmaprs temprs storageshower powerliners zpwrchrome-host zemacs elisprs vimlrs
```

Upgrades:

```bash
brew update && brew upgrade <formula>   # or `brew upgrade` for all
```

---

## [0x01] FORMULAS

| Formula | Repo | Binaries | Latest version |
|---|---|---|---|
| [`stryke`](Formula/stryke.rb) | [strykelang](https://github.com/MenkeTechnologies/strykelang) | `stryke` `s` `st` | tracks strykelang release tags |
| [`zshrs`](Formula/zshrs.rb) | [zshrs](https://github.com/MenkeTechnologies/zshrs) | `zshrs` `zd` | tracks zshrs release tags |
| [`zshrs-all`](Formula/zshrs-all.rb) | [zshrs](https://github.com/MenkeTechnologies/zshrs) | `zshrs` `zd` `zshrs-recorder` `zshrs-daemon` | tracks zshrs release tags (conflicts with `zshrs`) |
| [`lsofrs`](Formula/lsofrs.rb) | [lsofrs](https://github.com/MenkeTechnologies/lsofrs) | `lsofrs` `lsf` | tracks lsofrs release tags |
| [`iftoprs`](Formula/iftoprs.rb) | [iftoprs](https://github.com/MenkeTechnologies/iftoprs) | `iftoprs` | tracks iftoprs release tags |
| [`awkrs`](Formula/awkrs.rb) | [awkrs](https://github.com/MenkeTechnologies/awkrs) | `awkrs` `aw` | tracks awkrs release tags |
| [`nmaprs`](Formula/nmaprs.rb) | [nmaprs](https://github.com/MenkeTechnologies/nmaprs) | `nmaprs` `nms` | tracks nmaprs release tags |
| [`temprs`](Formula/temprs.rb) | [temprs](https://github.com/MenkeTechnologies/temprs) | `temprs` `tp` | tracks temprs release tags |
| [`storageshower`](Formula/storageshower.rb) | [storageshower](https://github.com/MenkeTechnologies/storageshower) | `storageshower` | tracks storageshower release tags |
| [`powerliners`](Formula/powerliners.rb) | [powerliners](https://github.com/MenkeTechnologies/powerliners) | `powerline` `powerline-daemon` `powerline-config` `powerline-render` `powerline-lint` | tracks powerliners release tags |
| [`zpwrchrome-host`](Formula/zpwrchrome-host.rb) | [zpwrchrome](https://github.com/MenkeTechnologies/zpwrchrome) | `zpwrchrome-host` | tracks zpwrchrome `host-v*` release tags |
| [`zemacs`](Formula/zemacs.rb) | [zemacs](https://github.com/MenkeTechnologies/zemacs) | `zemacs` | tracks zemacs release tags |
| [`elisprs`](Formula/elisprs.rb) | [elisprs](https://github.com/MenkeTechnologies/elisprs) | `elisp` | tracks elisprs release tags |
| [`vimlrs`](Formula/vimlrs.rb) | [vimlrs](https://github.com/MenkeTechnologies/vimlrs) | `vimlrs` | tracks vimlrs release tags |

---

## [0x02] PLATFORM SUPPORT

| Formula | x86_64-darwin | aarch64-darwin | x86_64-linux | aarch64-linux |
|---|:---:|:---:|:---:|:---:|
| `stryke` | ✓ | ✓ | ✓ | ✓ |
| `zshrs` | ✓ | ✓ | ✓ | ✓ |
| `zshrs-all` | ✓ | ✓ | ✓ | ✓ |
| `lsofrs` | ✓ | ✓ | ✓ | ✓ |
| `iftoprs` | ✓ | ✓ | ✓ | ✓ |
| `awkrs` | — (3-target release) | ✓ | ✓ | ✓ |
| `nmaprs` | ✓ | ✓ | ✓ | ✓ |
| `temprs` | ✓ | ✓ | ✓ | ✓ |
| `storageshower` | ✓ | ✓ | ✓ | ✓ |
| `powerliners` | ✓ | ✓ | ✓ | ✓ |
| `zpwrchrome-host` | ✓ | ✓ | ✓ | ✓ |
| `zemacs` | ✓ | ✓ | ✓ | ✓ |
| `elisprs` | — (5-target release) | ✓ | ✓ | ✓ |
| `vimlrs` | ✓ | ✓ | ✓ | ✓ |

Every formula ships aarch64-linux; `awkrs` and `elisprs` are the formulas without an x86_64-darwin bottle.

---

## [0x03] AUTO-UPDATE MECHANISM

Each formula here is updated automatically by the source repo's `Release` workflow (`.github/workflows/release.yml`, or `release-host.yml` for `zpwrchrome-host`). When a release tag is pushed on the source repo (`v*` for most tools, `host-v*` for `zpwrchrome-host` since the host crate ships independently of the Chrome extension's own `v*` tags):

1. The `build` job produces per-target `*.tar.gz` binary archives + uploads as workflow artifacts.
2. The `publish` job creates a GitHub Release with the tarballs attached.
3. The `homebrew` job downloads the tarballs, computes `sha256sum` per file, and overwrites the matching `Formula/<name>.rb` here with the new version + sha256s. Pushed via `HOMEBREW_TAP_TOKEN` (a GitHub PAT with `contents:write` on this repo, set as a secret on each source repo).

Formula updates show up as commits authored by `github-actions[bot]`.

---

## [0xFF] LICENSE

MIT License. See each source repo's LICENSE for per-tool terms (all MIT, except `zemacs` which is MPL-2.0 on the Helix engine).
