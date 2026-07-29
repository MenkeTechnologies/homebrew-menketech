class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.1/zvcs-v0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "bbe614666fab4b8f58c8bcbe9180d0226a7a2505a2f5695cc46508973d5ff34f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.1/zvcs-v0.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d58f331fb03a1be791f1849b583d9b40bbb1c0491f45bffe4b46d4e865903992"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.1/zvcs-v0.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03e1a3154bb9aacc78ad76fb24c87cbeceb83f3440cef9249261e64c567f5035"
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
  #   zvcs-v0.14.1-x86_64-unknown-linux-musl.tar.gz  sha256: 28a3c1f64c7c0e0a613c9e9543b6d0396740e97b468273b41a5cb797572cc963
  #   zvcs-v0.14.1-aarch64-unknown-linux-musl.tar.gz  sha256: b4ae245848d26c61fa2e9bd7ba7743c1499b64ba9d39843ed7863f90f56c1e4f
end
