class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.1/zvcs-v0.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c64de2b3e6c89fa805dd93467665c10ae72584674b486eeb155ba2e8fd343df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.1/zvcs-v0.22.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8438b3de58edd202e1fac21082d08efeec47eea9259f20d6ae9d16d147efca7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.1/zvcs-v0.22.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f128de9fc232024eb50c17bd4386bd038024709c72594eeeea5f3b815c7a9733"
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
  #   zvcs-v0.22.1-x86_64-unknown-linux-musl.tar.gz  sha256: 9dd8f616c1cd5d4f37002d4b5defe6628a1895e2d16b26ace83b08d3eff4b20f
  #   zvcs-v0.22.1-aarch64-unknown-linux-musl.tar.gz  sha256: 8d6c1aaedbf83d5fbd1a49457aa2e31fc3adba8215b78e5011b00946b808133f
end
