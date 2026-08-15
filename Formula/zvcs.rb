class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.14/zvcs-v0.14.14-aarch64-apple-darwin.tar.gz"
      sha256 "a45ae3f09876c1054d6e132797e4c287ef86ac737c182cfdb2f0efd9666291de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.14/zvcs-v0.14.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7ce7d7359acfb5a41bb93c482bf47efac895d7aaa3f3077aa0806eb1688422c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.14/zvcs-v0.14.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85f5fa66f87c612cc76a73973e3e1136908618a0bffbb8a77418070e6976d566"
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
  #   zvcs-v0.14.14-x86_64-unknown-linux-musl.tar.gz  sha256: 38da0665dca92990e3a8935344693b96ccd13677fd2087bb2a425210cd878a27
  #   zvcs-v0.14.14-aarch64-unknown-linux-musl.tar.gz  sha256: 6850b397cee33794e29a266adfba9d77a34ee557e3f612dda30087e7104086a9
end
