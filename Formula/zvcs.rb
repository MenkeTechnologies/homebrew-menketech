class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.8/zvcs-v0.22.8-aarch64-apple-darwin.tar.gz"
      sha256 "47e11e3c0e301ecaada2165d49f7e117008f57f566e31e26df24b5c6a016b542"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.8/zvcs-v0.22.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcbe6e3fb1f4e2f5d93c398a652a4932dda8bae7f96ca20b1ea87a349c3ce3f2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.8/zvcs-v0.22.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45705338195f54d8902451a22f3bab8bdd5a6a08fe7a63dbb6d5e340a128dc3d"
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
  #   zvcs-v0.22.8-x86_64-unknown-linux-musl.tar.gz  sha256: 69144329693d2ae74f90bf1ded0ff7dbab4c04dbdd5d7a40692fdc71d4e1e509
  #   zvcs-v0.22.8-aarch64-unknown-linux-musl.tar.gz  sha256: 512651bf3dc2f490f4331b6e51e5a467189ebdd3e70d66135f3c0cadfa3c78f8
end
