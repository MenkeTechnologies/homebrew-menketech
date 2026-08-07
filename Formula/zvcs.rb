class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.9/zvcs-v0.14.9-aarch64-apple-darwin.tar.gz"
      sha256 "3f8e68b998185ee46f9b33e53fd2b37b89742b319e7c0b4216482e07970859b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.9/zvcs-v0.14.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53e29775039ef4c01b484be2af3fbe70e6d21bcab1d06d637cd662d7966efaa3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.9/zvcs-v0.14.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bded62c9d2f8ad622e7acf430d3bfee12d927b9ce36be2889cc8f1c948e7d27"
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
  #   zvcs-v0.14.9-x86_64-unknown-linux-musl.tar.gz  sha256: f9037434dff2727f6da7545afa76d761da56f7165c014964a4abcca37ccc3c73
  #   zvcs-v0.14.9-aarch64-unknown-linux-musl.tar.gz  sha256: 418cb29a10d8ddebfdeb0106f803cdcc29c52f296334fe6417f864f33b087aca
end
