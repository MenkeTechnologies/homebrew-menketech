class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.18/vimlrs-v0.2.18-aarch64-apple-darwin.tar.gz"
      sha256 "a64c00229998a5c9623b74aef8881928d0840a7d49cf449ab349e134f7ff4c78"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.18/vimlrs-v0.2.18-x86_64-apple-darwin.tar.gz"
      sha256 "d5d49615b4e204061811dc751c0bb376b3e1e6e8af05976e0d09c1fa1e9e8409"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.18/vimlrs-v0.2.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "037c3c53c3d7330acef4fd14203f51cb1c2b7164c97f194323e1361d536ab725"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.18/vimlrs-v0.2.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f70fd44c6962d5e6127a91a38a356e5d6adfc856b1c5801b9f90466d5897eccb"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.18-x86_64-unknown-linux-musl.tar.gz  sha256: 578ae4b851776cd8d51b6837eb62d1931889aee9fa436b46541e24b8117cefd2
  #   vimlrs-v0.2.18-aarch64-unknown-linux-musl.tar.gz  sha256: 93078c2734feb60ca2c837b7467f585cbca23f0563db3b39b38fe6ed23198cff
end
