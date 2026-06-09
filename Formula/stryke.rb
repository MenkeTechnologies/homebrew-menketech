class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.32/stryke-v0.16.32-aarch64-apple-darwin.tar.gz"
      sha256 "a0933e4ba44a1059e1002d57e1245715f95c377de4f17c2286bd9b3333dcf8bd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.32/stryke-v0.16.32-x86_64-apple-darwin.tar.gz"
      sha256 "6073b815db03181eacd1addc38d3e13e510725fe74331439268fdbfc310c8d2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.32/stryke-v0.16.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.32/stryke-v0.16.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "558d8d42b43247fba766d1a2ad0c160b37d21d73f77f4982db300e5ccafcd786"
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
