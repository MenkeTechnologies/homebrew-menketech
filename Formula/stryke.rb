class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.52/stryke-v0.17.52-aarch64-apple-darwin.tar.gz"
      sha256 "463c0afe417c63f5fb2c04cffde3e1620b10253bfb0f778198635a2a99fe2d31"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.52/stryke-v0.17.52-x86_64-apple-darwin.tar.gz"
      sha256 "53d2d77d567a97fc3ed870aaa82400f2b8345cdbf30c371b249911f7a77bfeb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.52/stryke-v0.17.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69fb1f06730e8db67209956abcccdb8b97388b8f5dcc8904698fdd232ae91be8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.52/stryke-v0.17.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e702de5c4be87a34840ba06a0f6a7a91a411cacad724fefdfd877c6e6e1e1f7"
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
