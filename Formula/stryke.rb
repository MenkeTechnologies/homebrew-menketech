class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.41/stryke-v0.17.41-aarch64-apple-darwin.tar.gz"
      sha256 "7b57084b900ccfdc93cc7a4f7eca2f8a001fae4295827504bcacde6962ec098c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.41/stryke-v0.17.41-x86_64-apple-darwin.tar.gz"
      sha256 "0215285db087bcc78824dfa05eb02b676f15b16f7f173450b0473df6238b0a12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.41/stryke-v0.17.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba3cf86eaced42a33869db65a11f5a3abddd473dfd6106ef73f56307495599a6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.41/stryke-v0.17.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19bf672554b20834d4d334a98920f0132b97e967cb8317c6faf7f4698abe23a3"
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
