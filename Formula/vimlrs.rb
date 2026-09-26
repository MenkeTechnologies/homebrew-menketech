class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.14/vimlrs-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "9a29d2e6a8a7e899c5d394813c86f5e1b799f42b8ae5e4c401c73a31264f3231"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.14/vimlrs-v0.2.14-x86_64-apple-darwin.tar.gz"
      sha256 "7b9978fb4c971bc2d29c515620b7650f3d0094c4a3af51ae328b95e4f2d08b28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.14/vimlrs-v0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccafce0ea420f9281fe61a0c03334a55a9503e70c3668761e40c1b8eba749ffb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.14/vimlrs-v0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5757d489c86f475531bcff4f6f87b4e3a184de53e1a31e2bca1c94ef9313d4e"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.14-x86_64-unknown-linux-musl.tar.gz  sha256: b8705f9b251c684eee91f659dbd1ba4343aaf3c4da90cee64e2b96fe22511db2
  #   vimlrs-v0.2.14-aarch64-unknown-linux-musl.tar.gz  sha256: f9d192c8616faa207aed47faf9df33bc2c0b597655920a04f998c0ae33c055ca
end
