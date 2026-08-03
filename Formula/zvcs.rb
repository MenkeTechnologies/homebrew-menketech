class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.5/zvcs-v0.14.5-aarch64-apple-darwin.tar.gz"
      sha256 "020c2152c8b564ab3b63bd56c0a1ea1875adec70a0a04f9e30a28be7bd19e7e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.5/zvcs-v0.14.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e92c58d9d7cb9f81b3e4df0ad9c618291e5ea06751f2fb4c1d6264d6de8ffdbc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.5/zvcs-v0.14.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5764247cbb7925a5c18dceab8c99fb5c9e3aca0a8e4d617d8252e600ae025350"
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
  #   zvcs-v0.14.5-x86_64-unknown-linux-musl.tar.gz  sha256: 8a9e31779b79e227222147c422c1528a2bd073645ab706eff2f40a6dada36156
  #   zvcs-v0.14.5-aarch64-unknown-linux-musl.tar.gz  sha256: 76c33c81f6cf7729ad3512da7ff97cfd66ea6fe28e90a0b2945902dc938684c8
end
