class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.15/vimlrs-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "bcb4a98c0a8a2ceb146f02ec6d082101bec00e6e9578ebc6c3d3c0fc6dc52c41"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.15/vimlrs-v0.2.15-x86_64-apple-darwin.tar.gz"
      sha256 "08a430f482c56e454f0449d2a6ca48461a95d124627aa2422522914efb2a498b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.15/vimlrs-v0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec810063444942fc665bfee210641490cc7214169114adcfd3a5bcf16b6feb1a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.15/vimlrs-v0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "daa1d2f8930a867b0811e14a1e33eff5756b9e9676c675e499c8306461e3bcec"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.15-x86_64-unknown-linux-musl.tar.gz  sha256: 17697522f2015f73b999c714b9524daab3893196aa75392d780b7ba0ac557417
  #   vimlrs-v0.2.15-aarch64-unknown-linux-musl.tar.gz  sha256: ea5229cebfdadf38bd8876bdfcc30a44bf04af7c4b0805d20b4cea75d47d31ef
end
