class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.18.0/zvcs-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "8a468bde3dd530d37667f03b30f979ee161caf14108967af000c5f882f82e121"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.18.0/zvcs-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08919216d598f364be39e264833506e76d603b1cdbb069ed5afd8217745179eb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.18.0/zvcs-v0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80bf6f150a1c5446dc578b40d34e78eed9fec3a0294cd106a4872deac782a341"
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
  #   zvcs-v0.18.0-x86_64-unknown-linux-musl.tar.gz  sha256: 260bc4a12f262a31de397c76ecdfae7cd3aaa91f7c9ec87bd9b57dca03be770f
  #   zvcs-v0.18.0-aarch64-unknown-linux-musl.tar.gz  sha256: 0b4ec4d61fde15d5ba05d1829e36c061edc5b68509bc4a0e4cf1f5552b895f58
end
