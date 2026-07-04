# homebrew-lockmac

Homebrew tap for [lockmac](https://github.com/Well365/si4lockmac) — a macOS
privacy veil with remote lock, dead-man switch, and emergency purge.

## Install

Open **Terminal** (Applications → Utilities). No Homebrew yet? Install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install lockmac:

```bash
brew tap Well365/lockmac
brew trust Well365/lockmac        # trust the third-party tap (Homebrew 6.x, if required)
brew install --cask lockmac       # or: brew install --cask si4lockmac
```

Both `lockmac` and `si4lockmac` install the same app. Or in one line, without a separate tap step:

```bash
brew install --cask Well365/lockmac/lockmac
```

## Update / uninstall

```bash
brew upgrade --cask lockmac     # update to the latest version
brew uninstall --cask lockmac   # remove the app
brew uninstall --zap --cask lockmac   # also remove config, cache, login agents
```

## Maintainer: cutting a new release

Automated: in the code repo, bump the version + commit, then run
`packaging/build-pkg.sh` — it builds the pkg and syncs the version + sha256 into
every `Casks/*.rb` here (and into the release repo). Then, from `si4lockmac-release/`,
run `./publish.sh` — it creates the GitHub Release on `Well365/si4lockmac`, uploads
the `.pkg`, and pushes the docs + this tap.

> The `.pkg` must be signed with a Developer ID and notarized, otherwise
> Gatekeeper blocks the `installer` step and `brew install --cask` fails for
> users. An unsigned pkg only works with a manual "Open Anyway".
