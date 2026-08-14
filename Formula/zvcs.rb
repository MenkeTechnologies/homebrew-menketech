class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.12/zvcs-v0.14.12-aarch64-apple-darwin.tar.gz"
      sha256 "739dff8e8f5b087ff2bdc6c81100e5fca64a7f120d6efb9e6d6e5c49008abe47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.12/zvcs-v0.14.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a54f4134f2a22f5134126d6e6a84de33d878ad4101c9eaad9c84a28364140dad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.12/zvcs-v0.14.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "279e3ca497b380632e956b3709d43720df02356491d35aa054f80194fe6f8226"
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
  #   zvcs-v0.14.12-x86_64-unknown-linux-musl.tar.gz  sha256: 9b6b06c7bce5ae528755777aa70ee6eeeb7bfdf895b37028a1c717e2e13c4dc1
  #   zvcs-v0.14.12-aarch64-unknown-linux-musl.tar.gz  sha256: 7fa7319dddea622f16d388cefd41ebcfbb55b3224ab47168c59ca39e82748fbd
end
