class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.21.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.21.0/zvcs-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "6966f8a9615fca93180b8d605c3bd82b7b77eb76afdd87eabcfb2bd439a54257"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.21.0/zvcs-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5e392519130970c30ec1bce9e4356092fb1421eb1a164a9256d57013092d653"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.21.0/zvcs-v0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2706458ee62a13e4ab5e330b3ccc48e4bfe4c1719d23c7e3de2ed017ccddf271"
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
  #   zvcs-v0.21.0-x86_64-unknown-linux-musl.tar.gz  sha256: 315fe56fac1fc92ab48a05020afb5eeb1a647876960cf72e896160bd022e8b9b
  #   zvcs-v0.21.0-aarch64-unknown-linux-musl.tar.gz  sha256: ddb4292d0a6ff5d8f4dd6e121649aa4fbed80152a1674ee6d5b9bf02b4205721
end
