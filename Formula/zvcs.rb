class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.8/zvcs-v0.14.8-aarch64-apple-darwin.tar.gz"
      sha256 "b432a776131269a851f0f3f0c7f5daa11fc5f5100a42c27b26cf7b14dd3b3346"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.8/zvcs-v0.14.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d101c910b06a65b2c9cb0cfcc0ca9170adf6165c3510f130551eb803f23a440"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.8/zvcs-v0.14.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a840e0daaa0f82027e5f14ff24660cb94dca09c333c70955827f03f25d9ce3f0"
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
  #   zvcs-v0.14.8-x86_64-unknown-linux-musl.tar.gz  sha256: 1dcbcc543efd8732d23c34b024c0b4bac59565493b5aba7995e339ef7a364ed8
  #   zvcs-v0.14.8-aarch64-unknown-linux-musl.tar.gz  sha256: ee71c7c5cff7a5631200045307cb68a12ee223626ca517f6a78f05b1e2d0ed90
end
