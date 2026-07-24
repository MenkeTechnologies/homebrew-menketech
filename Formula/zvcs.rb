class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.5.0/zvcs-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "855781abb9b0ac256a33afd724bbdb8e21091274b9a3c8455011257323c4eb84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.5.0/zvcs-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d0ca16e10fcd8df28d11924d344b14d349b84602a8a514ac1c1fb7dabb33ea5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.5.0/zvcs-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eea6926d55f7bf181b349c3eda13a363ccb580ba3a01bbfb4e1e10471cfcd311"
    end
  end

  def install
    bin.install "git" => "zvcs"
  end

  def caveats
    <<~EOS
      zvcs installs the git-shadowing binary as `zvcs`.
      To shadow stock git (serve `git` from zvcs), put it ahead of git on PATH:
        alias git="#{opt_bin}/zvcs"
      or symlink it (replaces git; reversible):
        ln -sf #{opt_bin}/zvcs "$(brew --prefix)/bin/git"
    EOS
  end

  test do
    assert_match "superset verbs", shell_output("#{bin}/zvcs __brew_test__ 2>&1", 1)
  end

  # Static musl tarballs also published at this release:
  #   zvcs-v0.5.0-x86_64-unknown-linux-musl.tar.gz  sha256: e33ec6770dd021114d93f9dec5f5d8551e37d2d5365e201dee5492079b6e71b2
  #   zvcs-v0.5.0-aarch64-unknown-linux-musl.tar.gz  sha256: 23346f716de5cf443c2ace47dfaed028b68ba3e943d0c2732324bc564ed2d00c
end
