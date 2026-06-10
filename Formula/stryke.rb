class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.43/stryke-v0.16.43-aarch64-apple-darwin.tar.gz"
      sha256 "273b50332fdba7f3c103cff35f0058f8dfcffa2c93d531131683019acac705f5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.43/stryke-v0.16.43-x86_64-apple-darwin.tar.gz"
      sha256 "436cde45ff21f1bbab975cd17d75da98fdb71a8e7ea3b35724d8c94c284907a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.43/stryke-v0.16.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.43/stryke-v0.16.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f612b1db3977b4a1610c1d37301e4f077e4e9605394fa15e5692431ec9ff9d3e"
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
