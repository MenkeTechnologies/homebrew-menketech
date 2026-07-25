class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.0/zvcs-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "fe8b1cac92ea3c8d3630c7943fa1c88bb861914cd8e94111e9d01a59f4f0754a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.0/zvcs-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5845beca6974a66d9164f7723779a53dd0c35dfbf6d6be31f4b19ad1fca7e481"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.0/zvcs-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8cf87a72d7178b6bdbb39c1ca41c16414b52d0f5c495bb2d831b34227f71338"
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
  #   zvcs-v0.9.0-x86_64-unknown-linux-musl.tar.gz  sha256: e2dedb86c9311977b20e160dd72db22142567b193de096102e116d70f686ca4c
  #   zvcs-v0.9.0-aarch64-unknown-linux-musl.tar.gz  sha256: bdaf043d7418bdc9bce6004ec9e4ef2fa94c57b892fdbbef297e93dba29e7d70
end
