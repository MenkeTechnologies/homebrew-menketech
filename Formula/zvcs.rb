class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.15.0/zvcs-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d7a278e95129322ab0d610096fdb5e5039170973a831d120188bb32b7e16711"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.15.0/zvcs-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d1fc9e92675008135e865ad5b0cf984427ef5f65ab4688da09828e4057b4106"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.15.0/zvcs-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff22df2d1f1011bf85c88bb3569cc61355e3f8b2ffbc249c8744e81d7295f248"
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
  #   zvcs-v0.15.0-x86_64-unknown-linux-musl.tar.gz  sha256: 535d00acbd1c40ec6961796f2ebb427a6d31fc0f857e11d5b512a5be1e8ecfa0
  #   zvcs-v0.15.0-aarch64-unknown-linux-musl.tar.gz  sha256: 4b2b6d07ee598ff8b762b49f209627f0b19e3aa4d4ffa6dc4ba81aced2829762
end
