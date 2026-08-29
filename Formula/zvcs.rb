class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.3/zvcs-v0.22.3-aarch64-apple-darwin.tar.gz"
      sha256 "8ba18c1f9e53a1378a4c5857634314aa4310af1dd00694cf41b51dd1c3d5c0c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.3/zvcs-v0.22.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d0b8d6a1f26d56e667119325d8a9729e6e7c1821c91536b08e5ead2e1eb93bc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.3/zvcs-v0.22.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "004309d01673399140639dc3177cf58d1b1c463feb3e4f62d8711fab924b2a98"
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
  #   zvcs-v0.22.3-x86_64-unknown-linux-musl.tar.gz  sha256: 47b9f61d0dc799da4b522e7660498e21aad4e7a630f315e5068d72273a8d0540
  #   zvcs-v0.22.3-aarch64-unknown-linux-musl.tar.gz  sha256: 2f7be558376bc5c2764987e480886de9995e3cfdd9b1000f07d439a6f5d47bb8
end
