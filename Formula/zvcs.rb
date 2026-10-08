class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.11/zvcs-v0.22.11-aarch64-apple-darwin.tar.gz"
      sha256 "6366ae63010d00189096c5dce45ca5e0e1f602d904f6375499bc70c5541a0112"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.11/zvcs-v0.22.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aaa2007f5354951f6370e916a00f7e7337465bd8e46f46a49d262f6c4400fcc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.11/zvcs-v0.22.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0887ba6b86e81f56e7d2b3e0f7032d93b4f3f15226b8bbb6bdfbf91ccd331b9f"
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
  #   zvcs-v0.22.11-x86_64-unknown-linux-musl.tar.gz  sha256: 3e9527a58e0b0742dc18e108401938df58cf2a1884075e60d5b77474172efda3
  #   zvcs-v0.22.11-aarch64-unknown-linux-musl.tar.gz  sha256: 18a9ab8e438a97eaca03447a2a4dc21e4736ae022ef49f8ac252817e16a4f311
end
