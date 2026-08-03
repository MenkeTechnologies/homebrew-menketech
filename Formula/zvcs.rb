class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.6/zvcs-v0.14.6-aarch64-apple-darwin.tar.gz"
      sha256 "c245be9cd1393cb61131289c33d68a37cbed9bd3e8052935721e3219f920201f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.6/zvcs-v0.14.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "238264a79a709722f2ebc1538f1fe6300a88541106dad9238165a01fe96187c7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.6/zvcs-v0.14.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7edc8360ad75a0b7d8712589601f59d6ed64f27035928877c3e9549dd00e2a1a"
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
  #   zvcs-v0.14.6-x86_64-unknown-linux-musl.tar.gz  sha256: 5f39804d62608540dab332164099a765bc7f120b75d2d85f34dbce78df68091b
  #   zvcs-v0.14.6-aarch64-unknown-linux-musl.tar.gz  sha256: a13f0ce59a46ab0c2a05526e53c81d244cb024d4e6b7cccf3f2a015052543864
end
