class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.17.0/zvcs-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "0b3ecd4f62932dbbc7d353a0fc74dc0976c1e96a37b9b114f3ea995227613adf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.17.0/zvcs-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28caadbd17597bfe69609a066fe982e060849f1394fa9bf72b5ee38f84e7099d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.17.0/zvcs-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd1953165575923708a760877b342458113c7d8bafb08945bbc1750304c429db"
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
  #   zvcs-v0.17.0-x86_64-unknown-linux-musl.tar.gz  sha256: 0b7fc204f013eb08009249cc2bc100beb939c24d94b14f259c6def2ec34b54da
  #   zvcs-v0.17.0-aarch64-unknown-linux-musl.tar.gz  sha256: bb9ccc8973e044d84f1492cab23293490838e5671f5524d0be5b16b8291ad154
end
