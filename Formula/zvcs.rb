class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.6/zvcs-v0.22.6-aarch64-apple-darwin.tar.gz"
      sha256 "c839ee92c1b7c3dac566c26d90b537866a337bc740310341eaf207d88d2e2ada"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.6/zvcs-v0.22.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abc1ddf9f0d8531892ffa3dfa5f124da682af9b022d44984996ac690bcd7fe3f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.6/zvcs-v0.22.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b33a90f6b7bc92e770b6f5e5ee30eff809de7bd10041fed3f4f2a82cee8bd829"
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
  #   zvcs-v0.22.6-x86_64-unknown-linux-musl.tar.gz  sha256: 2455fc148bddb68a8e5df728ce4a110f6d1e5a55d6281eb40891b9691f07b8cd
  #   zvcs-v0.22.6-aarch64-unknown-linux-musl.tar.gz  sha256: e911574521dabd5f0c4b61402bfba7a4c78c4c8f23b6f65d63f065e2cf968365
end
