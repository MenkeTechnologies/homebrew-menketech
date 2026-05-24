```
 ███╗   ███╗███████╗███╗   ██╗██╗  ██╗███████╗████████╗███████╗ ██████╗██╗  ██╗
 ████╗ ████║██╔════╝████╗  ██║██║ ██╔╝██╔════╝╚══██╔══╝██╔════╝██╔════╝██║  ██║
 ██╔████╔██║█████╗  ██╔██╗ ██║█████╔╝ █████╗     ██║   █████╗  ██║     ███████║
 ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██╔═██╗ ██╔══╝     ██║   ██╔══╝  ██║     ██╔══██║
 ██║ ╚═╝ ██║███████╗██║ ╚████║██║  ██╗███████╗   ██║   ███████╗╚██████╗██║  ██║
 ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Formulas](https://img.shields.io/badge/formulas-7-cyan.svg)](Formula/)

### `[HOMEBREW TAP // ALL MENKETECHNOLOGIES CLI TOOLS // ONE \`brew tap\` AWAY]`

> *"`brew install stryke zshrs lsofrs awkrs iftoprs nmaprs tp` — done."*

Single tap that ships pre-built binaries for every CLI tool in the [MenkeTechnologies](https://github.com/MenkeTechnologies) family. Updated automatically by each tool's GitHub Actions `Release` workflow — when a `v*` tag is pushed on `strykelang` / `zshrs` / `lsofrs` / `iftoprs` / `awkrs` / `nmaprs` / `temprs`, the formula here gets a fresh version + sha256 sums for every platform.

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
brew install lsofrs      # rust lsof: lsofrs + lsf
brew install iftoprs     # rust iftop: iftoprs
brew install awkrs       # rust awk: awkrs + aw
brew install nmaprs      # rust nmap: nmaprs + nms
brew install temprs      # tempfile stack manager: temprs + tp

# or install everything in one go
brew install stryke zshrs lsofrs iftoprs awkrs nmaprs temprs
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
| [`lsofrs`](Formula/lsofrs.rb) | [lsofrs](https://github.com/MenkeTechnologies/lsofrs) | `lsofrs` `lsf` | tracks lsofrs release tags |
| [`iftoprs`](Formula/iftoprs.rb) | [iftoprs](https://github.com/MenkeTechnologies/iftoprs) | `iftoprs` | tracks iftoprs release tags |
| [`awkrs`](Formula/awkrs.rb) | [awkrs](https://github.com/MenkeTechnologies/awkrs) | `awkrs` `aw` | tracks awkrs release tags |
| [`nmaprs`](Formula/nmaprs.rb) | [nmaprs](https://github.com/MenkeTechnologies/nmaprs) | `nmaprs` `nms` | tracks nmaprs release tags |
| [`temprs`](Formula/temprs.rb) | [temprs](https://github.com/MenkeTechnologies/temprs) | `temprs` `tp` | tracks temprs release tags |

---

## [0x02] PLATFORM SUPPORT

| Formula | x86_64-darwin | aarch64-darwin | x86_64-linux | aarch64-linux |
|---|:---:|:---:|:---:|:---:|
| `stryke` | ✓ | ✓ | ✓ | ✓ (since zshrs 0.11.14) |
| `zshrs` | ✓ | ✓ | ✓ | — (3-target release) |
| `lsofrs` | ✓ | ✓ | ✓ | — |
| `iftoprs` | ✓ | ✓ | ✓ | — |
| `awkrs` | ✓ | ✓ | ✓ | — |
| `nmaprs` | ✓ | ✓ | ✓ | — |
| `temprs` | ✓ | ✓ | ✓ | — |

aarch64-linux support coverage will grow as upstream release matrices add the target.

---

## [0x03] AUTO-UPDATE MECHANISM

Each formula here is updated automatically by the source repo's `Release` workflow (`.github/workflows/release.yml`). When a `v*` tag is pushed on the source repo:

1. The `build` job produces per-target `*.tar.gz` binary archives + uploads as workflow artifacts.
2. The `publish` job creates a GitHub Release with the tarballs attached.
3. The `homebrew` job downloads the tarballs, computes `sha256sum` per file, and overwrites the matching `Formula/<name>.rb` here with the new version + sha256s. Pushed via `HOMEBREW_TAP_TOKEN` (a GitHub PAT with `contents:write` on this repo, set as a secret on each source repo).

Formula updates show up as commits authored by `github-actions[bot]`.

---

## [0xFF] LICENSE

MIT License — Jacob Menke. See each source repo's LICENSE for per-tool terms (all MIT).
