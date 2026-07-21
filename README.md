```
 ███╗   ███╗███████╗███╗   ██╗██╗  ██╗███████╗████████╗███████╗ ██████╗██╗  ██╗
 ████╗ ████║██╔════╝████╗  ██║██║ ██╔╝██╔════╝╚══██╔══╝██╔════╝██╔════╝██║  ██║
 ██╔████╔██║█████╗  ██╔██╗ ██║█████╔╝ █████╗     ██║   █████╗  ██║     ███████║
 ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██╔═██╗ ██╔══╝     ██║   ██╔══╝  ██║     ██╔══██║
 ██║ ╚═╝ ██║███████╗██║ ╚████║██║  ██╗███████╗   ██║   ███████╗╚██████╗██║  ██║
 ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Formulas](https://img.shields.io/badge/formulas-29-cyan.svg)](Formula/)
[![Casks](https://img.shields.io/badge/casks-1-magenta.svg)](Casks/)

### `[HOMEBREW TAP // ALL MENKETECHNOLOGIES CLI TOOLS // ONE \`brew tap\` AWAY]`

> *"`brew install stryke zshrs lsofrs awkrs iftoprs nmaprs temprs storageshower powerliners zpwrchrome-host` — done."*

Single tap that ships pre-built binaries for every CLI tool in the [MenkeTechnologies](https://github.com/MenkeTechnologies) family. Updated automatically by each tool's GitHub Actions `Release` workflow — when a `v*` (or `host-v*` for `zpwrchrome-host`) tag is pushed on `strykelang` / `zshrs` / `lsofrs` / `iftoprs` / `htoprs` / `awkrs` / `nmaprs` / `grcrs` / `temprs` / `storageshower` / `powerliners` / `zpwrchrome` / `zmax` / `elisprs` / `vimlrs` / `ztmux` / `zcolorizer` / `zwire-host` / `rubylang` / `phplang` / `node-js` / `javars` / `kotlinrs` / `scalars` / `groovyrs` / `pythonrs` / `arb`, the formula here gets a fresh version + sha256 sums for every platform.

### [`MenkeTechnologies on GitHub`](https://github.com/MenkeTechnologies) &middot; [`strykelang`](https://github.com/MenkeTechnologies/strykelang) · [`zshrs`](https://github.com/MenkeTechnologies/zshrs) · [`MenkeTechnologiesMeta`](https://github.com/MenkeTechnologies/MenkeTechnologiesMeta)

---

## Table of Contents

- [\[0x00\] Quick Start](#0x00-quick-start)
- [\[0x01\] Formulas](#0x01-formulas)
- [\[0x02\] Casks](#0x02-casks)
- [\[0x03\] Platform Support](#0x03-platform-support)
- [\[0x04\] Auto-Update Mechanism](#0x04-auto-update-mechanism)
- [\[0xFF\] License](#0xff-license)

---

## [0x00] QUICK START

```bash
brew tap MenkeTechnologies/menketech
brew install stryke      # the language: stryke + s + st
brew install zshrs       # the shell: zshrs + zd
brew install zshrs-all   # full install: zshrs + zd + zshrs-recorder + zshrs-daemon (conflicts with zshrs)
brew install zshrs-daemon # zshrs daemon + zd only, for non-zshrs shells (conflicts with zshrs / zshrs-all)
brew install lsofrs      # rust lsof: lsofrs + lsf
brew install iftoprs     # rust iftop: iftoprs
brew install htoprs      # rust htop: interactive process viewer
brew install awkrs       # rust awk: awkrs + aw
brew install nmaprs      # rust nmap: nmaprs + nms
brew install grcrs       # rust grc: generic colouriser: grc + grcat
brew install temprs      # tempfile stack manager: temprs + tp
brew install storageshower # cyberpunk disk-usage TUI: storageshower
brew install powerliners # rust powerline port: powerline + powerline-daemon + powerline-config + powerline-render + powerline-lint
brew install zpwrchrome-host # native messaging host for the zpwrchrome Chrome extension: zpwrchrome-host
brew install zmax        # modal text editor on the Helix engine: zmax
brew install elisprs     # Emacs Lisp on the fusevm bytecode VM (AOT + rkyv cache): elisp
brew install vimlrs      # rust Vimscript (VimL) interpreter: vimlrs
brew install ztmux       # rust tmux port: full terminal multiplexer, server + client: ztmux
brew install zcolorizer  # ccze port
brew install zwire-host  # universal local IPC host: system stats, fs, exec, PTY, kv: zwire-host
brew install rubylang    # compiled Ruby on the fusevm bytecode VM + Cranelift JIT: ruby
brew install phplang     # compiled PHP on the fusevm bytecode VM + Cranelift JIT: php
brew install node-js     # compiled JavaScript on the fusevm bytecode VM + Cranelift JIT: node
brew install javars      # compiled Java on the fusevm bytecode VM + Cranelift JIT (no JVM): java
brew install kotlinrs    # compiled Kotlin on the fusevm bytecode VM + Cranelift JIT (no JVM): kotlin
brew install scalars     # compiled Scala on the fusevm bytecode VM + Cranelift JIT (no JVM): scala
brew install groovyrs    # compiled Groovy on the fusevm bytecode VM + Cranelift JIT (no JVM): groovy
brew install pythonrs    # compiled Python on the fusevm bytecode VM + Cranelift JIT: python
brew install arb         # visualize & modify Unix pipelines — a dynamic TUI for every pipeline: arb

# or install everything in one go
brew install stryke zshrs lsofrs iftoprs htoprs awkrs nmaprs grcrs temprs storageshower powerliners zpwrchrome-host zmax elisprs vimlrs ztmux zcolorizer zwire-host rubylang phplang node-js javars kotlinrs scalars groovyrs pythonrs arb

# casks (macOS GUI apps)
brew install --cask zwire # Chromium rebrand: zpwrchrome power-tool, cyberpunk theme + new-tab on a Blink base
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
| [`zshrs-daemon`](Formula/zshrs-daemon.rb) | [zshrs](https://github.com/MenkeTechnologies/zshrs) | `zshrs-daemon` `zd` | tracks zshrs release tags (conflicts with `zshrs` / `zshrs-all`) |
| [`lsofrs`](Formula/lsofrs.rb) | [lsofrs](https://github.com/MenkeTechnologies/lsofrs) | `lsofrs` `lsf` | tracks lsofrs release tags |
| [`iftoprs`](Formula/iftoprs.rb) | [iftoprs](https://github.com/MenkeTechnologies/iftoprs) | `iftoprs` | tracks iftoprs release tags |
| [`htoprs`](Formula/htoprs.rb) | [htoprs](https://github.com/MenkeTechnologies/htoprs) | `htoprs` | tracks htoprs release tags |
| [`awkrs`](Formula/awkrs.rb) | [awkrs](https://github.com/MenkeTechnologies/awkrs) | `awkrs` `aw` | tracks awkrs release tags |
| [`nmaprs`](Formula/nmaprs.rb) | [nmaprs](https://github.com/MenkeTechnologies/nmaprs) | `nmaprs` `nms` | tracks nmaprs release tags |
| [`grcrs`](Formula/grcrs.rb) | [grcrs](https://github.com/MenkeTechnologies/grcrs) | `grc` `grcat` | tracks grcrs release tags |
| [`temprs`](Formula/temprs.rb) | [temprs](https://github.com/MenkeTechnologies/temprs) | `temprs` `tp` | tracks temprs release tags |
| [`storageshower`](Formula/storageshower.rb) | [storageshower](https://github.com/MenkeTechnologies/storageshower) | `storageshower` | tracks storageshower release tags |
| [`powerliners`](Formula/powerliners.rb) | [powerliners](https://github.com/MenkeTechnologies/powerliners) | `powerline` `powerline-daemon` `powerline-config` `powerline-render` `powerline-lint` | tracks powerliners release tags |
| [`zpwrchrome-host`](Formula/zpwrchrome-host.rb) | [zpwrchrome](https://github.com/MenkeTechnologies/zpwrchrome) | `zpwrchrome-host` | tracks zpwrchrome `host-v*` release tags |
| [`zmax`](Formula/zmax.rb) | [zmax](https://github.com/MenkeTechnologies/zmax) | `zmax` | tracks zmax release tags |
| [`elisprs`](Formula/elisprs.rb) | [elisprs](https://github.com/MenkeTechnologies/elisprs) | `elisp` | tracks elisprs release tags |
| [`vimlrs`](Formula/vimlrs.rb) | [vimlrs](https://github.com/MenkeTechnologies/vimlrs) | `vimlrs` | tracks vimlrs release tags |
| [`ztmux`](Formula/ztmux.rb) | [ztmux](https://github.com/MenkeTechnologies/ztmux) | `ztmux` | tracks ztmux release tags |
| [`zcolorizer`](Formula/zcolorizer.rb) | [zcolorizer](https://github.com/MenkeTechnologies/zcolorizer) | `zcolorizer` | tracks zcolorizer release tags |
| [`zwire-host`](Formula/zwire-host.rb) | [zwire-host](https://github.com/MenkeTechnologies/zwire-host) | `zwire-host` | tracks zwire-host release tags |
| [`rubylang`](Formula/rubylang.rb) | [rubylang](https://github.com/MenkeTechnologies/rubylang) | `ruby` | tracks rubylang release tags |
| [`phplang`](Formula/phplang.rb) | [phplang](https://github.com/MenkeTechnologies/phplang) | `php` | tracks phplang release tags |
| [`node-js`](Formula/node-js.rb) | [node-js](https://github.com/MenkeTechnologies/node-js) | `node` | tracks node-js release tags |
| [`javars`](Formula/javars.rb) | [javars](https://github.com/MenkeTechnologies/javars) | `java` | tracks javars release tags |
| [`kotlinrs`](Formula/kotlinrs.rb) | [kotlinrs](https://github.com/MenkeTechnologies/kotlinrs) | `kotlin` | tracks kotlinrs release tags |
| [`scalars`](Formula/scalars.rb) | [scalars](https://github.com/MenkeTechnologies/scalars) | `scala` | tracks scalars release tags |
| [`groovyrs`](Formula/groovyrs.rb) | [groovyrs](https://github.com/MenkeTechnologies/groovyrs) | `groovy` | tracks groovyrs release tags |
| [`pythonrs`](Formula/pythonrs.rb) | [pythonrs](https://github.com/MenkeTechnologies/pythonrs) | `python` | tracks pythonrs release tags |
| [`arb`](Formula/arb.rb) | [arb](https://github.com/MenkeTechnologies/arb) | `arb` | tracks arb release tags |

---

## [0x02] CASKS

macOS GUI apps, installed with `brew install --cask <name>`.

| Cask | Repo | App | Latest version |
|---|---|---|---|
| [`zwire`](Casks/zwire.rb) | [zwire](https://github.com/MenkeTechnologies/zwire) | `zwire.app` | tracks zwire `v*` release tags |

`zwire` ships only the self-contained macOS `.app` (requires macOS Big Sur or newer). The `.app` is ad-hoc signed, not notarized — on first launch, right-click `zwire.app` → Open, or install with `brew install --cask --no-quarantine zwire` to bypass Gatekeeper.

---

## [0x03] PLATFORM SUPPORT

| Formula | x86_64-darwin | aarch64-darwin | x86_64-linux | aarch64-linux |
|---|:---:|:---:|:---:|:---:|
| `stryke` | ✓ | ✓ | ✓ | ✓ |
| `zshrs` | ✓ | ✓ | ✓ | ✓ |
| `zshrs-all` | ✓ | ✓ | ✓ | ✓ |
| `zshrs-daemon` | ✓ | ✓ | ✓ | ✓ |
| `lsofrs` | ✓ | ✓ | ✓ | ✓ |
| `iftoprs` | ✓ | ✓ | ✓ | ✓ |
| `htoprs` | ✓ | ✓ | ✓ | ✓ |
| `awkrs` | — (3-target release) | ✓ | ✓ | ✓ |
| `nmaprs` | ✓ | ✓ | ✓ | ✓ |
| `grcrs` | ✓ | ✓ | ✓ | ✓ |
| `temprs` | ✓ | ✓ | ✓ | ✓ |
| `storageshower` | ✓ | ✓ | ✓ | ✓ |
| `powerliners` | ✓ | ✓ | ✓ | ✓ |
| `zpwrchrome-host` | ✓ | ✓ | ✓ | ✓ |
| `zmax` | — (3-target release) | ✓ | ✓ | ✓ |
| `elisprs` | — (5-target release) | ✓ | ✓ | ✓ |
| `vimlrs` | ✓ | ✓ | ✓ | ✓ |
| `ztmux` | ✓ | ✓ | ✓ | ✓ |
| `zcolorizer` | ✓ | ✓ | ✓ | ✓ |
| `zwire-host` | ✓ | ✓ | ✓ | ✓ |
| `rubylang` | ✓ | ✓ | ✓ | ✓ |
| `phplang` | ✓ | ✓ | ✓ | ✓ |
| `node-js` | ✓ | ✓ | ✓ | ✓ |
| `javars` | ✓ | ✓ | ✓ | ✓ |
| `kotlinrs` | ✓ | ✓ | ✓ | ✓ |
| `scalars` | ✓ | ✓ | ✓ | ✓ |
| `groovyrs` | ✓ | ✓ | ✓ | ✓ |
| `pythonrs` | — (2-target release) | ✓ | ✓ | — (2-target release) |
| `arb` | ✓ | ✓ | ✓ | ✓ |

Most formulas ship aarch64-linux; `awkrs`, `elisprs`, `zmax`, and `pythonrs` are the formulas without an x86_64-darwin bottle (`pythonrs` also lacks aarch64-linux).

---

## [0x04] AUTO-UPDATE MECHANISM

Each formula here is updated automatically by the source repo's `Release` workflow (`.github/workflows/release.yml`, or `release-host.yml` for `zpwrchrome-host`). When a release tag is pushed on the source repo (`v*` for most tools, `host-v*` for `zpwrchrome-host` since the host crate ships independently of the Chrome extension's own `v*` tags):

1. The `build` job produces per-target `*.tar.gz` binary archives + uploads as workflow artifacts.
2. The `publish` job creates a GitHub Release with the tarballs attached.
3. The `homebrew` job downloads the tarballs, computes `sha256sum` per file, and overwrites the matching `Formula/<name>.rb` here with the new version + sha256s. Pushed via `HOMEBREW_TAP_TOKEN` (a GitHub PAT with `contents:write` on this repo, set as a secret on each source repo).

Formula updates show up as commits authored by `github-actions[bot]`.

---

## [0xFF] LICENSE

MIT License. See each source repo's LICENSE for per-tool terms (all MIT, except `zmax` which is MPL-2.0 on the Helix engine and `htoprs` which is GPL-2.0-or-later).
