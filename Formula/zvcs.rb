class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.0/zvcs-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "f955f591e675f74b959292cafab9d4c896c99b6efa471c35f8024fc5423fc3b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.0/zvcs-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32e30ac200e8bde566a9a83826d4f579fe95df4adad7c2ebf0eb3aa42eeafef9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.0/zvcs-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85f67746ea4a8e2e09a9326e6dafdce329b3fc13056ffb74844160d2e0a850dc"
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
  #   zvcs-v0.14.0-x86_64-unknown-linux-musl.tar.gz  sha256: 11061f4f3caa48dc0bffe3fb4a8d6fb854e6bb5f6d4a888a8165de4e7b40feeb
  #   zvcs-v0.14.0-aarch64-unknown-linux-musl.tar.gz  sha256: 5f62c373ab4c5018dce8679070357d5d0f52d21a64f8e5a2e87e1468f46aed98
end
