class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.16.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.16.0/zvcs-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "ab9d859f16f69ad8d83a090cf9391b22fb846d3abe98ee5ba7c16cde5863b1a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.16.0/zvcs-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ae1175bacbc3e1e2071d79756ceeb5414537e5a41b641f2acaf925b2bb6edde"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.16.0/zvcs-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed2477b99b19da953353ccb894f76f29e3f046d0f3e61098de1de7a9084c8223"
    end
  end

  def install
    bin.install "git" => "zvcs"
  end

  def caveats
    <<~EOS
      zvcs installs the git-shadowing binary as `zvcs`, so it never clobbers
      the git formula. One command installs the shadow and prints the shell
      lines that activate it:

        zvcs zshadow

      Put those lines in your shell rc (or eval them in this shell):

        eval "$(zvcs zshadow)"

      They put ~/.zvcs/bin ahead of stock git on PATH (a `git` symlink to
      this binary, plus a `git-<verb>` link for every verb), ~/.zvcs/man on
      MANPATH, and the zvcs zsh completion on fpath. In a new shell, `git`
      is served by zvcs; drop the PATH line to undo it.

      Re-run `zvcs zshadow` after `brew upgrade` so the symlink follows the
      new build.
    EOS
  end

  test do
    assert_match "superset verbs", shell_output("#{bin}/zvcs __brew_test__ 2>&1", 1)
  end

  # Static musl tarballs also published at this release:
  #   zvcs-v0.16.0-x86_64-unknown-linux-musl.tar.gz  sha256: 5009eae4173754a053fe520f7d5a988bc91e653148a28fc50253d6e6df685d1c
  #   zvcs-v0.16.0-aarch64-unknown-linux-musl.tar.gz  sha256: 19a95c4640f96727a6aba8a000784d9d8ba277e57371549711cc56230f8e7446
end
