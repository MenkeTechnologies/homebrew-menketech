class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.19.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.19.0/zvcs-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "a9a884f889f08ab413314e443ffb35b0d9cce5e7962781e82f9a898d090c7495"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.19.0/zvcs-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c51c08673db35c3232bdd3b6c5435dfcc7b76b88b020ad68245b32768c7dd0da"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.19.0/zvcs-v0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c92926d45b3a43bba496b828be121ef4dbe6a7406c8e4473b0f980dbb2426f15"
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
  #   zvcs-v0.19.0-x86_64-unknown-linux-musl.tar.gz  sha256: b6ce9d6d2c11a20d0813f4f2fbac5be24a5e0e25d24612e343236b17faf89670
  #   zvcs-v0.19.0-aarch64-unknown-linux-musl.tar.gz  sha256: b59e8e16a4fba66bdfe9c53e85a44ffc583ae43b87e2096efbc8b38338335536
end
