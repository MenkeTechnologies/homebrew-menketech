class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.13.0/zvcs-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "60dd8d45dce335da3278586f17f3c1f39cbc8d72d71c444ae9a6f44babcfe17f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.13.0/zvcs-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "889b291dda7ff1e37da6bb42c288000d9f191472f7612b93a783c9caa53f1ded"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.13.0/zvcs-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3dc32e38be4e1322c58206c5b76ffe9939c793c80c742072291959c8ebcbd48a"
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
  #   zvcs-v0.13.0-x86_64-unknown-linux-musl.tar.gz  sha256: 5524c309274900980af52e31bfe3856297a15d9d3991bbd092453baa12a984bc
  #   zvcs-v0.13.0-aarch64-unknown-linux-musl.tar.gz  sha256: 6bdd8e6a758aec27309153aa14df3982f1fa8d389c3024bd9b03b906c89f3ea2
end
