class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.11/zvcs-v0.14.11-aarch64-apple-darwin.tar.gz"
      sha256 "f1a07fec969ffe15132d529f6e6488f00ba24974061bab3d0b2c2a8725cca3e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.11/zvcs-v0.14.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "157b8bb4e467b6b1c84e2d4d9f37af9d5987c0da11572496f930ec4692b02db7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.11/zvcs-v0.14.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "755fc5d7809f0080e94aa42814d6ff6ac8064a234d79c0fe407816b5d7641530"
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
  #   zvcs-v0.14.11-x86_64-unknown-linux-musl.tar.gz  sha256: 43ff07d02549b9b489d40774e3520c68485e99037298e98eff7b33ef8ca65b3e
  #   zvcs-v0.14.11-aarch64-unknown-linux-musl.tar.gz  sha256: 5b2389fefb77fb70a017bd1cbcbd1800f78b6a017302c7cf53b0b409310be63b
end
