class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.4/zvcs-v0.14.4-aarch64-apple-darwin.tar.gz"
      sha256 "781b4bf6b77c52d035b8f2c7d2957ab40a0941834ad87e708652490c9751cd97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.4/zvcs-v0.14.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e99b1ded59fce89d12fd0344c15d5f822541ddf6ca779bdb056500804c1021a1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.4/zvcs-v0.14.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adfb4caa7acb8d2024918f8d56a00d48cbd4d656178277c664a3af6276192855"
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
  #   zvcs-v0.14.4-x86_64-unknown-linux-musl.tar.gz  sha256: 880a46d5a3c0d95681018a3e3e96b36999bb640afd9a77bf85f7a6b64cec9f91
  #   zvcs-v0.14.4-aarch64-unknown-linux-musl.tar.gz  sha256: eb86fb1825cf73e6f736b2a03a359d2c276d125ed51bd4a81a9b83ca94b32687
end
