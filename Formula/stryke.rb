class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.7/stryke-v0.17.7-aarch64-apple-darwin.tar.gz"
      sha256 "eaa3caf1e6687aa00b6a24d11f88eba1702b0381add61de08661797ca8d446bf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.7/stryke-v0.17.7-x86_64-apple-darwin.tar.gz"
      sha256 "564d8271d12223951e2baf6712db7c0c6871488b2cc95a970392088df3516549"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.7/stryke-v0.17.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.7/stryke-v0.17.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cfbc97226051397debcaf2683e199f93b7fdad2f5e1bba8a5f16b2c40bd60a8"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
