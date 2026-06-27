class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.31/stryke-v0.17.31-aarch64-apple-darwin.tar.gz"
      sha256 "379077c7f7b226916bfe9ebf0b694449387b4295c8c32597d34fda99cfeb84bd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.31/stryke-v0.17.31-x86_64-apple-darwin.tar.gz"
      sha256 "e1037ecaa4baa3892b1080ea4cd4f3a071c6b08dca6ca30f0a040d153baeb99a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.31/stryke-v0.17.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e461998835288524622a5a161ed4632e9073d1c9703ad5c592bf6b2c4390d3b6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.31/stryke-v0.17.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90ac5680df4e894da1602bc3045424bf8fc4943056acb671ec89ba350f5b36c2"
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
