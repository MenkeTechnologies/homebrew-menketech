class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.0/zvcs-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "b3652bf92e47c5672be39acdb400f02be392aeddd0aeb9b380b26dfa94a28386"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.0/zvcs-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d8979b5d2703744010e5b9c3d84a62b1b69a75d7d57dadd6866ecbc9263400d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.0/zvcs-v0.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8dab98015fdc5f5126960395f3bed511e08d0b484bb1b42ac69503dea692042"
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
  #   zvcs-v0.22.0-x86_64-unknown-linux-musl.tar.gz  sha256: ebbda34641515d1ceaa87527d45a86b2c2ccfa57efbeb7ae987293b54ff3a608
  #   zvcs-v0.22.0-aarch64-unknown-linux-musl.tar.gz  sha256: 7e4115e83f7e6ff1054da1978bc7875d68ce840b5a6eb503098ef475ca0d7160
end
