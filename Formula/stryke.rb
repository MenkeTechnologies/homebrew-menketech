class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.59/stryke-v0.17.59-aarch64-apple-darwin.tar.gz"
      sha256 "ce317dd73ebcfc2ee607421b9817cc2ab74089b718633337d1c143a0820520d8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.59/stryke-v0.17.59-x86_64-apple-darwin.tar.gz"
      sha256 "e619a0bebb2cbe7d3af53ea84bffbf8a89eb52a72dc0ab7ce134c6598620faa7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.59/stryke-v0.17.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "454ecccb58b552ab1aaeb8a521247ea751bc5535a4890cf12861d8789d07d42b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.59/stryke-v0.17.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6051fdc150a2cb53f8c7f704c7d8c7d522314df6bce09a9fd723f5062f7f62a2"
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
