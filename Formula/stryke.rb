class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.34/stryke-v0.17.34-aarch64-apple-darwin.tar.gz"
      sha256 "db2fd8a5f2c37660cae2eb6247a1eda3d99a922b02050c67b1aba81e36037052"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.34/stryke-v0.17.34-x86_64-apple-darwin.tar.gz"
      sha256 "513d3d401e5161172223a5e130caba27e00f642828bd8f37b3888c5e4a765a6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.34/stryke-v0.17.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5626920b179ab272dbb570f9e526fe17159047198f7a01e25fd2b479e53ea162"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.34/stryke-v0.17.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6d217d7ed4631e3a7b3bab12f3555097d242f1a6feced9415fdb080dc79d492"
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
