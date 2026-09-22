class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.7/zvcs-v0.22.7-aarch64-apple-darwin.tar.gz"
      sha256 "5a0270c648bbd3b58c29a724a828cc7782e3dae2a60e5da5ced91eda2ec4d15b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.7/zvcs-v0.22.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc72d2a03ab0493cb61577222b366174eb2cf30ccdf7127a0c412df16a91fc98"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.7/zvcs-v0.22.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cba43ae8fa2d49fcf6334c99628663345dab4424d5d31dfd6477d6cdbec8ca68"
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
  #   zvcs-v0.22.7-x86_64-unknown-linux-musl.tar.gz  sha256: fa3f407dce1d1332593cf92e709b89f217d347807913611f81dd16d67456d63c
  #   zvcs-v0.22.7-aarch64-unknown-linux-musl.tar.gz  sha256: 00650fb4026a59bc1351ef95f3576a407ae75679fd467edb270cf9a6fd8a7917
end
