class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.11.0/zvcs-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "621a6476eb9792fb2db4b373f3a5897db84c742fa115ce5d2124d779465a9501"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.11.0/zvcs-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d317fd7ecf9292c7545a7ef167b466dcddb9e10ae8aa21455a076018c29899ef"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.11.0/zvcs-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7759a41c3448fa832bb2b7580b92ffd9cd2e452320b49a5dbfd2ba293980fb73"
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
  #   zvcs-v0.11.0-x86_64-unknown-linux-musl.tar.gz  sha256: 32c89be7aa086c11f202a2ce06e2c468fadea83a51f07d3ca3a3c2b2f1cb4760
  #   zvcs-v0.11.0-aarch64-unknown-linux-musl.tar.gz  sha256: 93e8bab60bd12c465fe444af4345431876d915dde942cb30245cfb1cc94dc3e6
end
